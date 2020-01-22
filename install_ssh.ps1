# Install SSH on Windows
# https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse

# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# start sshd daemon:
Start-Service sshd

# set ssh daemon to run on system startup:
Set-Service -Name sshd -StartupType 'Automatic'

# set ssh agent to run on system startup:
Set-Service -Name ssh-agent -StartupType 'Automatic'

# If the firewall does not exist, create one
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22

# verify installation
Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'

# set default shell to powershell 
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force

# OPTIONAL:
# install OpenSSH utilities:
# Install-Module -Name OpenSSHUtils -RequiredVersion 1.0.0.1
# Check current version: https://www.powershellgallery.com/packages/OpenSSHUtils/1.0.0.1