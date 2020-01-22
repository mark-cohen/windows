# enter password
Write-Host "Enter the password"

#Declare variables
$Password = Read-Host -AsSecureString
$Name = "susan-staff"
$FullName = "Susan Staffer"
$Description = "Staff Account"
$Group - "Users"

# Create the user
New-LocalUser $Name -Password $Password -FullName $FullName -Description $Description

# add local user to group; if an admin, to the "Administrators" group:
Add-LocalGroupMember -Group $Group -Member $Name
