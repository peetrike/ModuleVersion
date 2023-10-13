@{
    RootModule           = 'ModuleVersion.psm1'
    ModuleVersion        = '0.0.1'

    GUID                 = '60dc6925-fc4b-4070-9c9e-e150e4ce6821'

    Author               = 'Peter Wawa'
    CompanyName          = '!Zum!'
    Copyright            = 'Copyright (c) 2023 !Zum!'

    Description          = 'Deal with installed module versions'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = '5.1'

    CompatiblePSEditions = @(
        'Core'
        'Desktop'
    )

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @('bin\ModuleVersion.dll')

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # Expensive for import time, no more than one should be used.
    # TypesToProcess = @('ModuleVersion.Types.ps1xml')

    # Format files (.ps1xml) to be loaded when importing this module.
    # Expensive for import time, no more than one should be used.
    # FormatsToProcess = @('ModuleVersion.Format.ps1xml')

    # Functions to export from this module
    FunctionsToExport    = @(
        'Find-ModuleVersion'
        'Get-ModuleHelpVersion'
        'Remove-ModuleVersion'
        'Update-LocalModule'
    )

    CmdletsToExport      = @()
    VariablesToExport    = @()
    AliasesToExport      = @(
        'Clean-ModuleVersion'
    )

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all files packaged with this module
    # FileList          = @()

    PrivateData          = @{
        PSData = @{
            Tags         = @(
                'PSEdition_Core'
                'PSEdition_Deskop'
                'Windows'
            )

            LicenseUri   = 'https://github.com/peetrike/ModuleVersion/blob/main/LICENSE'
            ProjectUri   = 'https://github.com/peetrike/ModuleVersion'
            ReleaseNotes = 'https://github.com/peetrike/ModuleVersion/blob/main/CHANGELOG.md'

            # A URL to an icon representing this module.
            # IconUri = ''

            # Prerelease string of this module
            # Prerelease = ''

            # Flag to indicate whether the module requires explicit user acceptance for install/update/save
            # RequireLicenseAcceptance = $false

            # External dependent modules of this module
            # ExternalModuleDependencies = @()
        }
    }
}
