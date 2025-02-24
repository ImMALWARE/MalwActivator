if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Активация Office 2013 через подмену sppc.dll'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Activating Office 2013 via replacing sppc.dll'}

cmd /c mklink "$env:ProgramFiles\Microsoft Office 15\root\vfs\System\sppcs.dll" "$env:SystemRoot\System32\sppc.dll"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest 'https://archive.org/download/asdcorpohook/sppc.dll' -OutFile "$env:ProgramFiles\Microsoft Office 15\root\vfs\System\sppc.dll"
Set-Location "$env:ProgramFiles\Microsoft Office\Office15"
cscript //nologo ospp.vbs /inpkey:MBQBN-CQPT6-PXRMC-TYJFR-3C8MY
pause