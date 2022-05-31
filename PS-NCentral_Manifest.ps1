
$FunctionsToExport = (Get-Module PS-NCentral).ExportedCommands.Values.Name

$Parms = @{
    RootModule = "PS-NCentral.psm1"
    Description = "PowerShell integration for N-Central(c) by N-Able(R)"
    Path = ("{0}\PS-NCentral.psd1" -f $PSScriptRoot )
    Author = "Adriaan Sluis"
    CompanyName = "Tosch Automatisering"
    Copyright = "(c) 2022 Tosch Automatisering BV. All rights reserved."
    ModuleVersion = "1.4.1"
    FunctionsToExport = $FunctionsToExport
    LicenseUri = 'https://github.com/ToschAutomatisering/PS-NCentral/blob/master/LICENSE'
    ProjectUri = 'https://github.com/ToschAutomatisering/PS-NCentral'
    Tags = 'PS-NCentral','N-Central','N-Able'
  }
  
  New-ModuleManifest @Parms
  #Update-ModuleManifest @Parms
  

  Test-ModuleManifest $Parms.path | Format-List

