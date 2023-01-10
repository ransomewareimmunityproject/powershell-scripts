# Disable remote interaction with services
$services = Get-Service
foreach ($service in $services) {
    if (($service.Name -ne "LanmanServer") -and ($service.Name -ne "LanmanWorkstation")) {
        Set-Service -Name $service.Name -StartupType Disabled
    }
}

# Disable remote interaction with scheduled tasks
$scheduledTasks = Get-ScheduledTask
foreach ($task in $scheduledTasks) {
    Unregister-ScheduledTask -TaskName $task.TaskName
}

# Disable DCOM
$DCOM = New-Object -com "Microsoft.SecurityConfiguraion.WmiV2Helper"
$DCOM.DCOMConfig("default")

# Disable Admin Shares
$shares = Get-WmiObject Win32_Share | Where-Object { $_.Type -eq 0 }
foreach ($share in $shares) {
    Remove-WmiObject -InputObject $share
}

# Disable Anonymous Access to Named Pipes
$pipes = Get-WmiObject -Class Win32_Pipe
foreach ($pipe in $pipes) {
    if ($pipe.Name -like "*anonymous*") {
        Remove-WmiObject -InputObject $pipe
    }
}

# Disable OLE objects
$olereg = New-Object -com "Microsoft.SecurityConfiguraion.WmiV2Helper"
$olereg.OLEConfig("default")
