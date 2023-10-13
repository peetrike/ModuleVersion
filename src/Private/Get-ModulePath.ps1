function Get-ModulePath {
    [CmdletBinding()]
    param (
            [PW.ModuleVersion.Scope]
        $Scope = 3
    )

    $PSVersionName = 'PowerShell'
    if ($PSVersionTable.PSVersion.Major -lt 6) {
        $PSVersionName = 'Windows' + $PSVersionName
    }

    $SearchPattern = switch ($Scope) {
        { $_.HasFlag([PW.ModuleVersion.Scope]::CurrentUser) } { '{0}*' -f $env:USERPROFILE }
        { $_.HasFlag([PW.ModuleVersion.Scope]::AllUsers) } { '{0}\' -f $env:ProgramFiles }
    }

    foreach ($pattern in $SearchPattern) {
        $env:PSModulePath -split [IO.Path]::PathSeparator | Where-Object {
            $_ -like ('{0}{1}\Modules' -f $Pattern, $PSVersionName) -and
            (Test-Path -Path $_)
        }
    }
}
