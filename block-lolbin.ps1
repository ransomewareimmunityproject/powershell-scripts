$binaries = "schtask.exe", "bcdedit.exe", "vssadmin.exe", "reg.exe", "vssvc.exe", "forfiles.exe", "attrib.exe", "WMIC.exe", "raserver.exe", "mshta.exe", "wbadmin.exe", "taskdl.exe", "cipher.exe", "fsutil.exe", "rundll32.exe", "mstsca.exe", "w32tm.exe", "msiexec.exe", "msbuild.exe", "wmic.exe", "bash.exe", "certutil.exe", "cmstp.exe", "at.exe", "atbroker.exe", "bitsadmin.exe", "CertOC.exe", "cmstp.exe", "customshellhost.exe", "diskshadow.exe", "Hh.exe", "Ie4uinit.exe", "Ieexec.exe", "msconfig.exe", "mshta.exe", "msdt.exe", "netsh.exe", "pcalua.exe", "Pcwrun.exe", "Regsvcs.exe", "regsvr32.exe", "rundll32.exe", "runexehelper.exe", "Runonce.exe", "Runscripthelper.exe", "Scriptrunner.exe", "Xwizard.exe", "wab.exe", "wuauclt.exe", "ttdinject.exe"
$directories = "C:\Windows\System32", "C:\Windows\SysWOW64"

foreach ($directory in $directories) {
    icacls $directory /deny *:(X)
}

foreach ($binary in $binaries) {
    $fullPath = Join-Path $directory $binary
    if (Test-Path $fullPath) {
        icacls $fullPath /deny *:(X)
    }
}

