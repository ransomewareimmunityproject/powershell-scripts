# Set the list of allowed services
$allowedServices = "wuauserv", "msiserver", "bits", "lanmanserver"

# Set the access control list (ACL) for the Services key in the registry to allow write permissions for the allowed services
$RegistryKey = "HKLM:\SYSTEM\CurrentControlSet\Services"
foreach ($service in $allowedServices) {
    icacls "$RegistryKey\$service" /grant *S-1-1-0:(W)
}

# Set the access control list (ACL) for the Services key in the registry to deny write permissions for all other services
icacls $RegistryKey /deny *S-1-1-0:(W)
