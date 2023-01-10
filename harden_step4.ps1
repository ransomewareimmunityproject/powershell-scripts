# Set High-entropy ASLR to On by default
$HighEntropyASLR = Get-RuleOption -Name "High-entropy ASLR"
$HighEntropyASLR.set_Item("Enabled", 1)
Set-RuleOption -Name "High-entropy ASLR" -OptionName "Enabled" -OptionValue 1

# Set Validate exception chains (SEHOP) to On by default
$SEHOP = Get-RuleOption -Name "Validate exception chains (SEHOP)"
$SEHOP.set_Item("Enabled", 1)
Set-RuleOption -Name "Validate exception chains (SEHOP)" -OptionName "Enabled" -OptionValue 1

# Set Validate heap integrity to On by default
$ValidateHeap = Get-RuleOption -Name "Validate heap integrity"
$ValidateHeap.set_Item("Enabled", 1)
Set-RuleOption -Name "Validate heap integrity" -OptionName "Enabled" -OptionValue 1

# Set Macro runtime scan scope to enable for all documents
$scanScope = Get-RuleOption -Name "Macro Runtime Scan Scope"
$scanScope.set_Item("Enabled", 2)
Set-RuleOption -Name "Macro Runtime Scan Scope" -OptionName "Enabled" -OptionValue 2


# Set Always prevent untrusted Microsoft Query files from opening to Enabled
New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Access\Security" -Name "VBAWarnOnRefresh" -PropertyType DWORD -Value 1 -Force

# Set Don’t allow Dynamic Data Exchange (DDE) server launch in Excel to Enabled
New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Excel\Security" -Name "VBAWarnOnDataConnections" -PropertyType DWORD -Value 1 -Force

# Set Don’t allow Dynamic Data Exchange (DDE) server lookup in Excel to Enabled
New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Excel\Security" -Name "VBAWarnOnDataConnections" -PropertyType DWORD -Value 1 -Force

# Set Block macros from running in Office files from the Internet to Enabled
New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Common\Security" -Name "BlockMacroOnUntrustedDoc" -PropertyType DWORD -Value 1 -Force

# Set VBA Macro Notification Settings to Disable all
$VbaNotificationSettings = Get-RuleOption -Name "VBA Macro Notification Settings"
$VbaNotificationSettings.set_Item("Enabled", 3)
Set-RuleOption -Name "VBA Macro Notification Settings" -OptionName "Enabled" -OptionValue 3
