# Import the AppLocker module
Import-Module AppLocker

# Create a new AppLocker rule to block execution of .exe files that are not digitally signed
New-AppLockerPolicyRule -FilePathRuleType Exe -FilePublisherCondition "*" -SignerType "NotSigned" -Action Block

# Enable the AppLocker rules
Set-AppLockerPolicy -PolicyObject (Get-AppLockerPolicy -Effective) -Enabled $true
