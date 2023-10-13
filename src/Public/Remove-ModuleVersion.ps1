function Remove-ModuleVersion {
    # .EXTERNALHELP ModuleVersion-help.xml
    [CmdletBinding(
        SupportsShouldProcess
    )]
    [Alias('Clean-ModuleVersion')]
    param (
            [Parameter(
                Position = 1
            )]
            [string]
            [SupportsWildcards()]
            # Specifies module name to search
        $Name = '*',
            [PW.ModuleVersion.Scope]
        $Scope = 3,
            [ValidateRange(1, 10)]
            [int]
            # Number of versions to keep
        $VersionCount = 2
    )

    foreach ($ModulePath in Get-ModulePath -Scope $Scope) {
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
}

Export-ModuleMember -Alias 'Clean-ModuleVersion'
