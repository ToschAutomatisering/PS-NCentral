## PS-NCentral Usage Examples
## Applies to version 1.3

# Load PS-NCentral module and display available commands.
Import-Module "$PSScriptRoot\PS-NCentral"
Get-NCHelp

## Connect to the N-Central server (interactive).
## This will also be initiated if any NC-command is given before connecting.
## After connecting NC-commands will keep using this connection/session.
## For advanced options type: Get-Help New-NCentralConnection.
New-NCentralConnection

## Fully automated connection using the Java Web Token (JWT);
## use the 1 line below, replace the <Data> tags.
#New-NCentralConnection "<NCentralFQDN>" -JWT "<JWT>"

## PS-NCentral commands can now be used for server-interaction.
## The NC-CmdLets can be used without the Get- prefix.

## Basic Examples (unmark individual lines)
#Get-NCCustomerList | Format-Table
#Get-NCCustomerList | Select-Object CustomerName,CustomerID,ExternalID,ExternalID2,ParentID | Format-Table
Get-NCVersion -Full
Get-NCDeviceLocal
Get-NCDeviceID "ComputerName" | Get-NCDeviceStatus | Out-GridView

## Example below has a different syntax for more efficient processing of the Get-NCDeviceInfo command.
,(Get-NCDeviceList 100) | Select-Object -First 2 | Get-NCDeviceInfo | Format-List

## Basic Custom-property
#Get-NCDeviceLocal | Set-NCDeviceProperty -PropertyName "Label" -PropertyValue "Value"

## Handle individual Custom Property values
## Add/Remove unique values in a Comma-separated Text-Property.
#Get-NCDevicePropertyValue <DeviceID> <PropertyLabel>
#Add-NCDevicePropertyValue <DeviceID> <PropertyLabel> <Value>
#Remove-NCDevicePropertyValue <DeviceID> <PropertyLabel> <Value>


## The Advanced Exmples may take some time to complete.

## Advanced Example 1: Pipeline using Filter and Export to file (unmark both lines).
#,(Get-NCDevicePropertyList -Filterid 1) | Get-NCDeviceInfo | Sort-object Customername, longname |
#Export-Csv C:\Temp\DetectedWindowsServersList.csv -Encoding UTF8 -NoTypeInformation

## Advanced Example 2: Pipeline using Local Computer and Device-object.
$Category = "ComputerSystem"
(Get-NCDeviceLocal | Get-NCDeviceObject -include $Category).$Category
#Get-NCDeviceLocal | Get-NCDeviceObject | Get-Member -MemberType NoteProperty | Select-Object Name			## See all categories

## Advanced Example 3: Placing and retrieving a list of objects in a (Customer) Custom Property.
##                     Using JSON for storage and Base64 Encoding for maintaining control-characters.
##                     Default Encoding uses UniCode, UTF8 is optional.
#[int]$CustomerID=100
#[string]$PropertyLabel = "CustomerTestData"
#$PropertyData = Get-NCDeviceList $CustomerID | Select-Object Deviceid, longname | ConvertTo-Json
#Set-NCCustomerProperty $CustomerID $PropertyLabel $PropertyData -Base64
#Get-NCCustomerProperty $CustomerID $PropertyLabel -Base64 | Convertfrom-Json



## Additonal sources

## NC-API-Documentation by David Brooks
## https://github.com/AngryProgrammerInside/NC-API-Documentation

