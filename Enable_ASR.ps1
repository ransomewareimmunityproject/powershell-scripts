# Get the list of ASR rules
$asrRules = Get-MpPreference -AttackSurfaceReductionRules

# Loop through each ASR rule and enable it
foreach ($rule in $asrRules) {
    # Check if the rule is disabled
    if ($rule.Setting -eq 0) {
        # Enable the rule
        Set-MpPreference -AttackSurfaceReductionRules_Ids $rule.Id -AttackSurfaceReductionRules_Actions Enable
    }
}

# Check the status of the ASR rules
Get-MpPreference -AttackSurfaceReductionRules
