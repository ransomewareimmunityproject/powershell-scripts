# Import the AppLocker module
Import-Module AppLocker

# Create a new AppLocker rule to block execution of .exe files compiled in debug mode
New-AppLockerPolicyRule -FilePathRuleType Exe -FilePublisherCondition "*" -DebugInformationType Debug -Action Block

# Enable the AppLocker rules
Set-AppLockerPolicy -PolicyObject (Get-AppLockerPolicy -Effective) -Enabled $true
