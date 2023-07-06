@{
    RootModule        = 'ModuleVersion.psm1'
    ModuleVersion     = '0.0.1'

    GUID              = '60dc6925-fc4b-4070-9c9e-e150e4ce6821'

    Author            = 'CPG4285'
    CompanyName       = 'MyCompany'
    Copyright         = 'Copyright (c) 2023 MyCompany'

    Description       = 'Deal with installed module versions'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

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
    FunctionsToExport = @(
        'Clean-ModuleVersion'
        'Find-ModuleVersion'
        'Update-LocalModule'
    )

    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all files packaged with this module
    # FileList          = @()

    PrivateData       = @{
        PSData = @{
            Tags         = @()

            LicenseUri   = ''
            ProjectUri   = ''
            ReleaseNotes = ''

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
