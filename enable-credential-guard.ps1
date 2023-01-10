# Check if the system meets the requirements for Credential Guard
if ((Get-WmiObject -Class Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard).Enabled -ne $true) {
    Write-Output "Credential Guard is not supported on this system"
    exit
}

# Check if Hyper-V is enabled
if (!(Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor)) {
    Write-Output "Hyper-V is not enabled on this system. Please enable Hyper-V and try again."
    exit
}

# Enable virtualization-based security
Enable-WindowsOptionalFeature -Online -FeatureName Windows-Hyper-V-Hypervisor-CredentialGuard

# Restart the system for the changes to take effect
Restart-Computer
