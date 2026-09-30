$imageUrl   = "https://njitcyber.com/img/csn_spider.png"
$websiteUrl = "https://njitcyber.com/"
$localPath  = "$env:TEMP\club_logo.jpg"

irm $imageUrl -OutFile $localPath

$code = @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

Add-Type -TypeDefinition $code

[Wallpaper]::SystemParametersInfo(0x0014, 0, $localPath, 0x01 -bor 0x02)

Start-Process $websiteUrl