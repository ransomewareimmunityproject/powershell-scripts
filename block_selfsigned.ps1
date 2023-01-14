# Import the AppLocker module
Import-Module AppLocker

# Define the rule properties
$rule = New-AppLockerFileInformation -Path "*" -Publisher "*" -Product "*" -FileName "*.exe"

# Create the rule
Add-AppLockerPolicyRule -RuleType Executable -RuleName "Block Self-Signed EXEs" -ExecutableRule $rule -User "Everyone" -Action Deny -Conditions "Publisher" -PublisherCondition "*" -SignerCondition "Unsigned"

# Enable AppLocker
Set-AppLockerPolicy -XMLPolicy (Get-AppLockerPolicy -Effective) -EnforcementMode Audit
