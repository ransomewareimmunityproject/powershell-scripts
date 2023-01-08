# Import the AppLocker module
Import-Module AppLocker

# Create a new AppLocker rule to allow execution of .exe files in the ProgramFiles directory
New-AppLockerPolicyRule -FilePathRuleType Exe -Path "C:\ProgramFiles\*" -Action Allow

# Create a new AppLocker rule to block execution of .exe files in all other directories
New-AppLockerPolicyRule -FilePathRuleType Exe -Path "*" -Action Block

# Enable the AppLocker rules
Set-AppLockerPolicy -PolicyObject (Get-AppLockerPolicy -Effective) -Enabled $true
