############################################################
# Powershell script to remove all non Windows and Microsoft Store apps in Windows 10, as well as select Windows apps
# More info: https://www.itninja.com/question/removing-bloatware-default-add-ins-windows-10-pro
############################################################

#Remove Most Provisioned Apps - Keep Basic Tools
Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -notlike "*windows*"} |Where-Object {$_.PackageName -notlike "*store*"} | Remove-AppxProvisionedPackage -Online

#Remove Most Apps - Keep Basic Tools
Get-AppxPackage -AllUsers  | Where-Object {$_.PackageFullName -notlike "*windows*"} |Where-Object {$_.PackageFullName -notlike "*store*"} |Remove-AppxPackage

# Remove Camera
Write-Host "Removing Camera"
Get-AppxPackage -allusers *camera* | Remove-AppxPackage

# Remove Feedback
Write-Host "Removing Feedback"
Get-AppxPackage -allusers *feedback* | Remove-AppxPackage

# Remove Maps
Write-Host "Removing Maps"
Get-AppxPackage -allusers *maps* | Remove-AppxPackage

# Remove Photos
Write-Host "Removing Photos"
Get-AppxPackage -allusers *photos* | Remove-AppxPackage

# Remove Voice Recorder
Write-Host "Removing Voice Recorder"
Get-AppxPackage -allusers *soundrecorder* | Remove-AppxPackage