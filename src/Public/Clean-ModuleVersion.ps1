function Clean-ModuleVersion {
    <#
        .SYNOPSIS
            Remove old installed module versions.
        .DESCRIPTION
            This script cleans up installed module versions, so that only desired number of versions is kept.
    #>
    [CmdletBinding(
        SupportsShouldProcess
    )]
    param (
            [Parameter(
                Position = 1
            )]
            [string]
            [SupportsWildcards()]
            # Specifies module name to search
        $Name = '*',
            [ValidateSet('AllUsers', 'CurrentUser')]
            [string]
        $Scope = 'AllUsers',
            [ValidateRange(1, 10)]
            [int]
            # Number of versions to keep
        $VersionCount = 2
    )

    $PSVersionName = 'PowerShell'
    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $PSVersionName = 'Windows' + $PSVersionName
    }
    $SearchPattern = switch ($Scope) {
        'AllUsers' { '{0}\' -f $env:ProgramFiles }
        'CurrentUser' { '{0}*' -f $env:USERPROFILE }
    }
    $ModulePath = $env:PSModulePath -split [IO.Path]::PathSeparator | Where-Object {
        $_ -like ('{0}{1}\Modules' -f $SearchPattern, $PSVersionName)
    }
    $SearchPath = Join-Path -Path $ModulePath -ChildPath $Name

    Get-ChildItem -Path $SearchPath -Include * -Directory |
        Group-Object { $_.Parent.Name } |
        Where-Object Count -GT $VersionCount |
        ForEach-Object {
            $ModuleName = $_.Name
            Write-Verbose -Message ('Processing module: {0}' -f $ModuleName)
            $DeleteList = $_.Group |
                Sort-Object { [version] $_.Name } -Descending |
                Select-Object -Skip $VersionCount
            foreach ($folder in $DeleteList) {
                $Message = 'Remove module "{0}" version' -f $ModuleName
                if ($PSCmdlet.ShouldProcess($folder.Name, $Message)) {
                    Remove-Item $folder -Recurse -Force -Confirm:$false
                }
            }
        }
}
