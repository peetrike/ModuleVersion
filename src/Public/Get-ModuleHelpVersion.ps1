function Get-ModuleHelpVersion {
    [CmdletBinding(
        DefaultParameterSetName = 'Name'
    )]
    param (
            [Parameter(
                ParameterSetName = 'Name',
                Position = 0
            )]
            [SupportsWildcards()]
            [string[]]
        $Name,
            [Parameter(
                Mandatory,
                ParameterSetName = 'ModuleInfo',
                ValueFromPipeline
            )]
            [Management.Automation.PSModuleInfo[]]
        $InputObject
    )

    begin {
        $HelpInfoNamespace = @{ helpInfo = 'http://schemas.microsoft.com/powershell/help/2010/05' }

        if ($PSCmdlet.ParameterSetName -like 'Name') {
            $InputObject = Get-Module @PSBoundParameters -ListAvailable
        }
    }

    process {
        foreach ($mModule in $InputObject) {
            $HelpPath = Join-Path -Path $mModule.ModuleBase -ChildPath ('{0}*helpinfo.xml' -f $mModule.Name)

            Get-ChildItem -Path $HelpPath |
                Select-Xml -Namespace $HelpInfoNamespace -XPath '//helpInfo:UICulture' |
                ForEach-Object {
                    [PSCustomObject] @{
                        ModuleName    = $mModule.Name
                        ModuleVersion = $mModule.Version
                        Culture       = $_.Node.UICultureName
                        Version       = $_.Node.UICultureVersion
                    }
                }
        }
    }
}
