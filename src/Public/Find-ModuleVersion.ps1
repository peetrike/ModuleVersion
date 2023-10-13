function Find-ModuleVersion {
    # .EXTERNALHELP ModuleVersion-help.xml
    [CmdletBinding()]
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
        $VersionCount = 2
    )

    foreach ($ModulePath in Get-ModulePath -Scope $Scope) {
        $SearchPath = Join-Path -Path $ModulePath -ChildPath $Name

        Get-ChildItem -Path $SearchPath -Include * -Directory |
            Group-Object { $_.Parent.Name } -NoElement |
            Where-Object Count -GT $VersionCount
    }
}
