# requires ISO present at defined path. Use Media Creation Tool to create ISO based on desired version.
$driveletter = (Mount-DiskImage "C:\temp\Windows.iso" -PassThru | Get-Volume).DriveLetter
& "${driveletter}:\setup.exe" /Auto Upgrade /Compat IgnoreWarning /Dynamicupdate enable /showoobe none /CopyLogs c:\temp /quiet 