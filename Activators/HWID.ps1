if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Активация Windows 10/11 через HWID'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Activating Windows 10/11 via HWID'}

Set-Location $env:SystemRoot\System32
./cscript.exe //nologo slmgr.vbs /ckms > $null
./cscript.exe //nologo slmgr.vbs /upk > $null
./cscript.exe //nologo slmgr.vbs /cpky > $null
./cscript.exe //nologo slmgr.vbs /ipk XGVPP-NMH47-7TTHJ-W3FW7-8HV2C > $null # Enterprise
./cscript.exe //nologo slmgr.vbs /ipk YNMGQ-8RYV3-4PGQ3-C8XTP-7CFBY > $null # Education
./cscript.exe //nologo slmgr.vbs /ipk 8PTT6-RNW4C-6V7J2-C2D3X-MHBPB > $null # Pro Education
./cscript.exe //nologo slmgr.vbs /ipk DXG7C-N36C4-C4HTG-X4T3X-2YV77 > $null # Pro for Workstations
./cscript.exe //nologo slmgr.vbs /ipk FWN7H-PF93Q-4GGP8-M8RF3-MDWWW > $null # LTSB 2015
./cscript.exe //nologo slmgr.vbs /ipk NK96Y-D9CD8-W44CQ-R8YTK-DYJWX > $null # LTSB 2016
./cscript.exe //nologo slmgr.vbs /ipk 43TBQ-NH92J-XKTM7-KT3KK-P39PB > $null # LTSC 2019
./cscript.exe //nologo slmgr.vbs /ipk YTMG3-N6DKC-DKB77-7M9GH-8HVX7 > $null # Home
./cscript.exe //nologo slmgr.vbs /ipk BT79Q-G7N6G-PGBYW-4YWX6-6F4BT > $null # Home Single Language
./cscript.exe //nologo slmgr.vbs /ipk XQQYW-NFFMW-XJPBH-K8732-CKFFD > $null # IoT Enterprise
./cscript.exe //nologo slmgr.vbs /ipk QPM6N-7J2WJ-P88HH-P3YRH-YY74H > $null # IoT Enterprise LTSC 2021
./cscript.exe //nologo slmgr.vbs /ipk CGK42-GYN6Y-VD22B-BX98W-J8JXD > $null # IoT Enterprise LTSC 2024
./cscript.exe //nologo slmgr.vbs /ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T > $null # Pro

New-Item -Path "$env:temp\MalwTool" -ItemType Directory > $null
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient
$wc.DownloadFile('https://download.microsoft.com/download/9/A/E/9AE69DD5-BA93-44E0-864E-180F5E700AB4/adk/Installers/14f4df8a2a7fc82a4f415cf6a341415d.cab', "$env:temp\MalwTool\GOS.cab")
./expand.exe -f:filf8377e82b29deadca67bc4858ed3fba9 "$env:temp\MalwTool\GOS.cab" "$env:temp\MalwTool"
Rename-Item -Path "$env:temp\MalwTool\filf8377e82b29deadca67bc4858ed3fba9" -NewName 'GOS.exe'
$f = [System.IO.File]::ReadAllBytes("$env:temp\MalwTool\GOS.exe")
$f[320] = 0xf8
$f[321] = 0xfb
$f[322] = 0x05
$f[324] = 0x03
$f[13672] = 0x25
$f[13674] = 0x73
$f[13676] = 0x3b
$f[13678] = 0x00
$f[13680] = 0x00
$f[13682] = 0x00
$f[13684] = 0x00
$f[32748] = 0xe9
$f[32749] = 0x9e
$f[32750] = 0x00
$f[32751] = 0x00
$f[32752] = 0x00
$f[32894] = 0x8b
$f[32895] = 0x44
$f[32897] = 0x64
$f[32898] = 0x85
$f[32899] = 0xc0
$f[32900] = 0x0f
$f[32901] = 0x85
$f[32902] = 0x1c
$f[32903] = 0x02
$f[32904] = 0x00
$f[32906] = 0xe9
$f[32907] = 0x3c
$f[32908] = 0x01
$f[32909] = 0x00
$f[32910] = 0x00
$f[32911] = 0x85
$f[32912] = 0xdb
$f[32913] = 0x75
$f[32914] = 0xeb
$f[32915] = 0xe9
$f[32916] = 0x69
$f[32917] = 0xff
$f[32918] = 0xff
$f[32919] = 0xff
$f[33094] = 0xe9
$f[33095] = 0x80
$f[33096] = 0x00
$f[33097] = 0x00
$f[33098] = 0x00
$f[33449] = 0x64
$f[33576] = 0x8d
$f[33577] = 0x54
$f[33579] = 0x24
$f[33580] = 0xe9
$f[33581] = 0x55
$f[33582] = 0x01
$f[33583] = 0x00
$f[33584] = 0x00
$f[33978] = 0xc3
$f[34189] = 0x59
$f[34190] = 0xeb
$f[34191] = 0x28
$f[34238] = 0xe9
$f[34239] = 0x4f
$f[34240] = 0x00
$f[34241] = 0x00
$f[34242] = 0x00
$f[34346] = 0x24
$f[34376] = 0xeb
$f[34377] = 0x63
[System.IO.File]::WriteAllBytes("$env:temp\MalwTool\GOS.exe", $f)
$r = 'HKCU:\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers'
if (-not (Test-Path $r)) {New-Item -Path $r -Force | Out-Null}; Set-ItemProperty -Path $r -Name "$env:temp\MalwTool\GOS.exe" -Value '~ WINXPSP3'

$wver = (Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\ProductOptions).OSProductPfn
Set-Location $env:temp\MalwTool
./GOS.exe /c Pfn=$wver`;PKeyIID=465145217131314304264339481117862266242033457260311819664735280
Set-Location $env:SystemRoot\System32
./clipup.exe -v -o -altto $env:temp\MalwTool
./cscript.exe //nologo slmgr.vbs /ato
pause