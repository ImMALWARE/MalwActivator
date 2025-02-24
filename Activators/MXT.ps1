if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Активация MobaXterm'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Activating MobaXterm'}

taskkill.exe /f /im mobaXterm.exe
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient
$wc.DownloadFile("https://malw.pythonanywhere.com/mxt?v=$(Get-Content "${env:ProgramFiles(x86)}\Mobatek\MobaXterm\version.dat" -TotalCount 1)", "${env:ProgramFiles(x86)}\Mobatek\MobaXterm\Custom.mxtpro")
Write-Host $(if ($PSUICulture -eq "ru-RU") { "MobaXterm активирован!" } else { "MobaXterm is activated!" })
pause