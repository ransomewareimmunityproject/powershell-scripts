# Get the list of network protection rules
$networkProtectionRules = Get-MpPreference -NetworkProtection

# Loop through each network protection rule and enable it
foreach ($rule in $networkProtectionRules) {
    # Check if the rule is disabled
    if ($rule.Setting -eq 0) {
        # Enable the rule
        Set-MpPreference -NetworkProtection_Ids $rule.Id -NetworkProtection_Actions Enable
    }
}

# Check the status of the network protection rules
Get-MpPreference -NetworkProtection
