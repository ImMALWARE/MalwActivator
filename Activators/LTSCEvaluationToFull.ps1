if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Конвертирование Windows 10 LTSC Evaluation в полноценную LTSC'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Converting Windows 10 LTSC Evaluation to full LTSC'}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient
New-Item -Path "$env:temp\MalwTool" -ItemType Directory > $null
$wc.DownloadFile('https://archive.org/download/ltscevaluation-to-full/LTSCEvaluationToFull.zip', "$env:temp\MalwTool\LTSCEvaluationToFull.zip")
Expand-Archive -Path "$env:temp\MalwTool\LTSCEvaluationToFull.zip" -DestinationPath "$env:SystemRoot\System32\spp\tokens\skus"
Set-Location $env:SystemRoot\System32
cscript.exe //nologo slmgr.vbs /rilc
cscript.exe //nologo slmgr.vbs /upk
cscript.exe //nologo slmgr.vbs /ckms
cscript.exe //nologo slmgr.vbs /cpky
cscript.exe //nologo slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D
sc.exe config LicenseManager start= auto
net start LicenseManager
sc.exe config wuauserv start= auto
net start wuauserv
pause