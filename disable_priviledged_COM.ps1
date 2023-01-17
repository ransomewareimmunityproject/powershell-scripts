# Create a new software restriction policy
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\COM" -Force | Out-Null
New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\COM" -Name "RestrictRun" -Value 1 -PropertyType DWORD -Force | Out-Null

# Get the list of privileged COM objects
$privilegedComObjects = (Get-WmiObject -Class "Win32_COMSetting" | Where-Object {$_.Elevation -eq "privileged"}).AppID

# Disable each privileged COM object
foreach($object in $privilegedComObjects)
{
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\COM\RestrictRun\List" -Force | Out-Null
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\COM\RestrictRun\List" -Name $object -Value 1 -PropertyType DWORD -Force | Out-Null
}
