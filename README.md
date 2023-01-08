# powershell-scripts
Powershell scripts for making your Windows System secured against Ransomeware threats! This scripts allow an administrator to harden the Windows Environment

# Usage
Run this scripts using powershell

# What above powershell scripts IS NOT
1. It does NOT prevent software from being exploited
2. It does NOT prevent the abuse of every available risky feature.
3. It does NOT prevent the changes it implements from being reverted. If malicious code runs on the system and it is able to restore them, the premise of the tool is defeated


# Is this script follows Zero Trust principle or not?
yes, this script enforces Zero Trust to a certain level supported by OS

# Inbuilt Security Feature used by this scripts
1. Applocker
2. WDAC
3. Group Policy
4. MS Defender

# version supports
All of the scripts run latest Windows 11 , Windows 10 and latest version of Windows server edition and some of these script won't run on older version of Windows 


# Note
1. Use this scripts with care and modify these scripts according to your system and environment
2. Always install an Antivirus or Windows Defender along with these scripts 

# Scripts and its purpose
1. Enable_ASR.ps1 - This script enables Attack Surface Reduction modules in Windows
2. Enable_netprotection.ps1 - this script enables network protection of Windows Defender
3. Block_lolbins.ps1 - This script blocks certain executable in system32 missused by malware
4. block-modification-services.ps1 - This script block modification of Windows services
5. block-sctask.ps1 - This script disable scheduled task creation
6. block_debug_exe.ps1 - This script blocks executables compiled in debug mode from execution
7. block_unsigned_exe.ps1 - This script block executables which are not signed from execution
8. block_write_autorun.ps1 - This script block process from modification of autorun in registry
9. disable-cmd.ps1 - This script blocks cmd.exe
10. disable-powershell.ps1 - This script blocks powershell.exe (Run this script at last)
11. enable-protected-folder.ps1 - This script enable protected folder
12. restrict-dll.ps1 - This script allow dll loading from program files directory only
13. restrict-exe.ps1 - This script allow exe loading from program files directory only
14. restrict-download.ps1 - This script blocks downloads in edge and internet explorer
15. Whitelist_lolbins.ps1 - This script whitelist blocked certain executable in system32 missused by malware


# Supplement software
https://github.com/securitywithoutborders/hardentools
Thanks @securitywithoutborders for harden 

Run Hardentool before Runing these scripts and Run only scripts who features  are not covered by Hardentools





