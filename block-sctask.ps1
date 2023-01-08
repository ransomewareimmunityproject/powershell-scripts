# Set the access control list (ACL) for the Scheduled Tasks folder to deny write permissions for all users and programs
$FolderPath = "C:\Windows\System32\Tasks"
icacls $FolderPath /deny *S-1-1-0:(W)
