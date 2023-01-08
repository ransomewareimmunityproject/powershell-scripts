# Import the Group Policy module
Import-Module GroupPolicy

# Set the path to the Group Policy object (GPO) that will be modified
$GpoPath = "LocalGPO"

# Set the name of the policy setting that will be disabled for Internet Explorer
$PolicyName = "Prevent access to the Internet Explorer download manager"

# Disable the policy setting for Internet Explorer
Set-GPRegistryValue -Name $PolicyName -Value 1 -Type DWord -Path $GpoPath

# Set the name of the policy setting that will be disabled for Microsoft Edge
$PolicyName = "Configure the default download behavior for Microsoft Edge"

# Disable the policy setting for Microsoft Edge
Set-GPRegistryValue -Name $PolicyName -Value 1 -Type DWord -Path $GpoPath

# Set the path to the Group Policy object (GPO) that will be linked
$OuPath = "OU=MyOU,DC=domain,DC=local"

# Link the GPO to the specified organizational unit (OU)
New-GPLink -Name $GpoPath -Target $OuPath -LinkEnabled Yes
