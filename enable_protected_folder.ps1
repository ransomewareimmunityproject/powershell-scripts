# Enable Controlled Folder Access
Set-MpPreference -ControlledFolderAccessEnabled 1

# Add folders to the Controlled Folder Access Protected Folders list
Add-MpPreference -ControlledFolderAccessProtectedFolders "C:\Users\Public\Documents", "C:\Users\Public\Pictures"

# Add processes to the Controlled Folder Access Allowed Processes list
Add-MpPreference -ControlledFolderAccessAllowedProcesses "C:\Program Files\Microsoft Office\Office16\OUTLOOK.EXE", "C:\Program Files\Microsoft Office\Office16\WINWORD.EXE"
