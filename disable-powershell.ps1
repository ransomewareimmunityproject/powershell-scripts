# Import the Group Policy module
Import-Module GroupPolicy

# Set the path to the Group Policy object (GPO) that will be modified
$GpoPath = "LocalGPO"

# Set the name of the policy setting that will be disabled
$PolicyName = "Turn off PowerShell Script Block Logging"

# Disable the policy setting
Set-GPRegistryValue -Name $PolicyName -Value 1 -Type DWord -Path $GpoPath

# Set the path to the Group Policy object (GPO) that will be linked
$OuPath = "OU=MyOU,DC=domain,DC=local"

# Link the GPO to the specified organizational unit (OU)
New-GPLink -Name $GpoPath -Target $OuPath -LinkEnabled Yes
