# Import the AppLocker module
Import-Module AppLocker

# Create a new AppLocker rule to allow the loading of .dll files in the ProgramFiles directory
New-AppLockerPolicyRule -FilePathRuleType Dll -Path "C:\ProgramFiles\*" -Action Allow

# Create a new AppLocker rule to block the loading of .dll files in all other directories
New-AppLockerPolicyRule -FilePathRuleType Dll -Path "*" -Action Block

# Enable the AppLocker rules
Set-AppLockerPolicy -PolicyObject (Get-AppLockerPolicy -Effective) -Enabled $true
