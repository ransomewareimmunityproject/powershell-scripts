# Set the access control list (ACL) for the AutoRun registry key to deny write permissions for all users and programs
$RegistryKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\policies\Explorer\Run"
icacls $RegistryKey /deny *S-1-1-0:(W)
