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

```
Get-ModuleHelpVersion [[-Module] <String[]>] [<CommonParameters>]
```

## DESCRIPTION

This function returns module help version and culture information.

## EXAMPLES

### Example 1

```powershell
Get-ModuleHelpVersion -Module PowerShellGet
```

This example returns module PowerShellGet help information

## PARAMETERS

### -Module

Specifies module name to check.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

Collection of module help information

## NOTES

## RELATED LINKS
