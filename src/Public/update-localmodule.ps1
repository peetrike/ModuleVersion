# Requires -RunAsAdministrator
# Requires -Modules PowerShellGet

function Update-LocalModule {
    # .EXTERNALHELP ModuleVersion-help.xml
    [CmdletBinding(SupportsShouldProcess)]
    param (
            [parameter(
                ValueFromPipeline,
                ValueFromPipelineByPropertyName
            )]
            [ValidateNotNullOrEmpty()]
            [SupportsWildcards()]
            [string[]]
        $Name = '*',
            [ValidateNotNullOrEmpty()]
            [string[]]
        $Repository = '*'
    )

    begin {
        if (-not (Test-IsAdmin)) {
            throw 'Admin permission required'
        }
        Import-Module PowerShellGet -Verbose:$false
        $CallerErrorActionPreference = $ErrorActionPreference

        $ModuleProps = @{
            ErrorAction = [Management.Automation.ActionPreference]::SilentlyContinue
        }
    }

    process {
        Get-Module -Name $Name -ListAvailable -Verbose:$false |
            Group-Object -Property Name |
            ForEach-Object {
                $module = $_

                $InstalledModule = Get-InstalledModule -Name $module.Name @ModuleProps |
                    Where-Object Repository -like $Repository
                if ($InstalledModule) {
                    if ($PSCmdlet.ShouldProcess($module.Name, 'Update module')) {
                        $UpdateProps = @{
                            Force   = $true
                            WhatIf  = $false
                            Confirm = $false
                        }
                        if ($InstalledModule.AdditionalMetadata.IsPrerelease) {
                            $UpdateProps.AllowPreRelease = $true
                        }
                        Update-Module -Name $InstalledModule.Name
                    }
                } else {
                    $ProposedModule = Find-Module -Name $module.Name @ModuleProps |
                        Sort-Object -Property Version -Descending |
                        Select-Object -First 1
                    if ($ProposedModule) {
                        $Newest = $module.Group |
                            Sort-Object -Property Version -Descending |
                            Select-Object -First 1
                        if (-not ($Edition = $PSEdition)) { $Edition = 'Desktop' }
                            # find-module returns version as string
                        if ([version]$ProposedModule.Version -gt $Newest.Version -and
                            $ProposedModule.Tags -match ('Windows|{0}' -f $Edition)
                        ) {
                            if ($PSCmdlet.ShouldProcess($module.Name, 'Install newer version of module')) {
                                $InstallSet = @{
                                    WhatIf  = $false
                                    Confirm = $false
                                    Force   = $true
                                    Scope   = 'AllUsers'
                                }
                                try {
                                    $ProposedModule | Install-Module @InstallSet -ErrorAction Stop
                                } catch {
                                    Write-Error -ErrorRecord $_ -ErrorAction $CallerErrorActionPreference
                                }
                            }
                        } else {
                            Write-Verbose -Message ('Module already up to date: {0}' -f $module.Name )
                        }
                    } else {
                        Write-Verbose -Message ('Module not found: {0}' -f $module.Name)
                    }
                }
            }
    }
}
