$NewComputerName = "Dev-Test"
#JasonChin1486

Write-Host "Renaming computer to $NewComputerName"
Rename-Computer -NewName $NewComputerName

Write-Host "Enabling Windows Optional Feature: IIS-WebServerRole."
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole