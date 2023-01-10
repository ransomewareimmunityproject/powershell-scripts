# Set Internet Explorer security prompt for Windows Installer scripts to Disabled
$regPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsInstaller"
New-ItemProperty -Path $regPath -Name "AlwaysInstallElevated" -PropertyType DWORD -Value 0 -Force

# Enable DNS Sinkhole in Defender
Set-MpPreference -EnableDnsSinkhole 1

# Set WinRM Client Allow Basic authentication to Disabled
winrm set winrm/config/client/auth '@{Basic="false"}'

# Set WinRM Client Allow unencrypted traffic to Disabled
winrm set winrm/config/client '@{AllowUnencrypted="false"}'

# Set WinRM Client Disallow Digest authentication to Enabled
winrm set winrm/config/client/auth '@{Digest="false"}'

# Set WinRM Service Allow remote server management through WinRM to Disabled
winrm set winrm/config/service/auth '@{Basic="false"}'

# Set WinRM Service Allow Basic authentication to Disabled
winrm set winrm/config/service '@{AllowRemoteAccess="false"}'

# Set WinRM Service Allow unencrypted traffic to Disabled
winrm set winrm/config/service '@{AllowUnencrypted="false"}'

# Set WinRM Service Disallow WinRM from storing RunAs credentials to Enabled
winrm set winrm/config/service '@{DisableRunAs="true"}'

# Set LSASS Protection Mode to Enabled
Set-RuleOption -Name "LSASS Protection Mode" -OptionName "Enabled" -OptionValue 1

# Set NetBT NodeType configuration to P-node
Set-NetBtTcpip -NodeType "P-node"

# Set WDigest Authentication to Disabled
$key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest"
New-ItemProperty -Path $key -Name "UseLogonCredential" -PropertyType DWORD -Value 0 -Force

# Set Control flow guard (CFG) to On by default
$CFG = Get-RuleOption -Name "Control flow guard (CFG)"
$CFG.set_Item("Enabled", 1)
Set-RuleOption -Name "Control flow guard (CFG)" -OptionName "Enabled" -OptionValue 1

# Set Data Execution Prevention (DEP) to On by default
$DEP = Get-RuleOption -Name "Data Execution Prevention (DEP)"
$DEP.set_Item("Enabled", 1)
Set-RuleOption -Name "Data Execution Prevention (DEP)" -OptionName "Enabled" -OptionValue 1

# Set Force randomization for images (Mandatory ASLR) to On by default
$MandatoryASLR = Get-RuleOption -Name "Force randomization for images (Mandatory ASLR)"
$MandatoryASLR.set_Item("Enabled", 1)
Set-RuleOption -Name "Force randomization for images (Mandatory ASLR)" -OptionName "Enabled" -OptionValue 1

