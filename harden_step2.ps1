# Set Microsoft Defender Exploit Guard Attack Surface Reduction Rules to disabled
$ASR = Get-MpPreference | Select-Object -ExpandProperty AttackSurfaceReductionRules
$ASR.set_Item("ExcludeFilesAndProcessesFromASR", 0)
Set-MpPreference -AttackSurfaceReductionRules $ASR

# Set Exclusions Path to Disabled
$ExclusionsPath = Get-MpPreference | Select-Object -ExpandProperty Exclusions
$ExclusionsPath.set_Item("Paths", $null)
Set-MpPreference -Exclusions $ExclusionsPath

# Turn on script scanning
Set-MpPreference -ScanScriptsEnabled 1

# Scan removable drives
Set-MpPreference -ScanRemovableDrivesEnabled 1

# Enable sandboxing for Microsoft Defender Antivirus
Set-MpPreference -MapiScanningEnabled 1

# Set Network Protection to Block
Set-MpPreference -EnableNetworkProtection 1

# Enable Application Guard (For Enterprise)
Enable-WindowsOptionalFeature -Online -FeatureName Windows-Defender-ApplicationGuard

# Set Always install with elevated privileges to disabled
Set-MpPreference -AlwaysInstallElevated 0
