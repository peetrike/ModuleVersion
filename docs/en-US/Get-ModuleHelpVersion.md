---
external help file: ModuleVersion-help.xml
Module Name: ModuleVersion
online version:
schema: 2.0.0
---

# Get-ModuleHelpVersion

## SYNOPSIS

Returns module help version and culture info

## SYNTAX

### Name (Default)
```
Get-ModuleHelpVersion [[-Name] <String[]>] [<CommonParameters>]
```

### ModuleInfo
```
Get-ModuleHelpVersion -InputObject <PSModuleInfo[]> [<CommonParameters>]
```

## DESCRIPTION

This function returns module help version and culture information.

## EXAMPLES

### Example 1

```powershell
Get-ModuleHelpVersion -Name PowerShellGet
```

This example returns module PowerShellGet help information

### Example 2

```powershell
Get-Module -Name PowerShellGet | Get-ModuleHelpVersion
```

This example returns module PowerShellGet help information

## PARAMETERS

### -InputObject

Takes ModuleInfo objects from Get-Module cmdlet

```yaml
Type: PSModuleInfo[]
Parameter Sets: ModuleInfo
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name

 Specifies names or name patterns of modules to check.

```yaml
Type: String[]
Parameter Sets: Name
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: True
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### PSModuleInfo[]

Collection of ModuleInfo objects from Get-Module

## OUTPUTS

### System.Object

Collection of module help information

## NOTES

## RELATED LINKS

[Get-Module](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/get-module)
