# Set the Group Policy Object (GPO) name and the path to the policy setting
$GpoName = "DisableCmd"
$PolicyPath = "Computer Configuration\Windows Settings\Security Settings\Software Restriction Policies"

# Create a new GPO
New-GPO -Name $GpoName

# Get the GPO
$Gpo = Get-GPO -Name $GpoName

# Enable the software restriction policies
Set-GPRegistryValue -Name $PolicyPath -Key "Security" -ValueName "Enforcement" -Type DWord -Value 1 -GPObject $Gpo

# Add the cmd.exe program to the restricted list
Add-GPRegistryValue -Name $PolicyPath\Additional Rules -Key "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe" -ValueName "Security" -Type DWord -Value 2 -GPObject $Gpo

# Link the GPO to the domain
New-GPLink -Name $GpoName -Target "dc=domain,dc=com"

# Force the GPO to be applied
Update-GPO -Name $GpoName
