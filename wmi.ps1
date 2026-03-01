$usb = "SELECT * FROM Win32_VolumeChangeEvent WHERE EventType = 2 AND DriveName = 'G:'"
$filter = Register-CimIndicationEvent -Namespace root\cimv2 -Query $usb -SourceIdentifier "NetLbfoTeamNic"
$injection = {
    Start-Process cmd.exe -ArgumentList "/c echo USB G: inserted & pause"
}
Register-CimIndicationEvent -Namespace root\cimv2 -Query $usb -Action $injection -SourceIdentifier "NetLbfoTeamMember"
