$w = New-Object -ComObject WScript.Shell
1..50 | ForEach-Object { $w.SendKeys([char]175) }

$h = $host.UI.RawUI
$h.BackgroundColor = 'DarkRed'
$h.ForegroundColor = 'White'
Clear-Host

Write-Host 'SECURITY ALERT: UNTRUSTED DEVICE DETECTED!!!'

$s = New-Object -ComObject SAPI.SpVoice
$s.Volume = 100
$s.Speak('Uh Oh Someone Plugged In Something They Should Not Have')