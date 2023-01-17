# Create a new software restriction policy
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\COM" -Force | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\COM" -Name "RestrictRun" -Value 1 -PropertyType DWORD -Force | Out-Null

# Get the list of approved COM objects from the registry
$approvedComObjects = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\UAC\COMAutoApprovalList").AutoApprovalList

# Disable each approved COM object
foreach($object in $approvedComObjects)
{
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\COM\RestrictRun\List" -Force | Out-Null
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\COM\RestrictRun\List" -Name $object -Value 1 -PropertyType DWORD -Force | Out-Null
}
