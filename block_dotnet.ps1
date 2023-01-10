# Define the list of executables to block
$executables = @("csc.exe", "DataSvcUtil.exe", "Ieexec.exe", "Ilasm.exe", "InstallUtil.exe", "Jsc.exe", "Microsoft.Workflow.Compiler.exe", "MSBuild.exe","dotnet.exe")

# Set the path to the .NET Framework folder
$dotnetPath = "C:\Windows\Microsoft.NET\Framework\"

# Loop through the list of executables
foreach ($executable in $executables) {

    # Construct the path to the executable
    $path = Join-Path -Path $dotnetPath -ChildPath $executable

    # Check if the file exists
    if (Test-Path -Path $path) {

        #Block the executable by adding a new rule to the Group Policy Editor
        New-GPRegistryValue -Name "Restrict_Execution_Of_Certain_Windows_Application" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName $executable -Type String -Value "0" 
    }
}
