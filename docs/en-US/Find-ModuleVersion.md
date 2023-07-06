---
external help file: ModuleVersion-help.xml
Module Name: ModuleVersion
online version:
schema: 2.0.0
---

# Find-ModuleVersion

## SYNOPSIS
Find local modules that have too many versions on disk

## SYNTAX

```
Find-ModuleVersion [[-Name] <String>] [-Scope <String>] [-VersionCount <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This script searches installed modules that have too many versions on disk.

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Name
Specifies module name to search

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: True
```

### -Scope
{{ Fill Scope Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: AllUsers
Accept pipeline input: False
Accept wildcard characters: False
```

### -VersionCount
{{ Fill VersionCount Description }}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 2
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
