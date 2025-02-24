[README на русском](https://github.com/ImMALWARE/MalwTool/blob/main/README.md)
# MalwTool — A Tool for Windows and Office activation, download, and configuration
![Screenshot](https://github.com/ImMALWARE/MalwTool/raw/main/files/screenshot_en.png?raw=true)

## Launch
To start, execute the following command. The easiest way is to open Windows search and run it there. You can also run it in Win + R, cmd, PowerShell, or New Shortcut Wizard
```pwsh
powershell -command "irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/MalwTool.ps1 | iex"
```
Second, shortened command variant (simple redirect to the same GitHub from my website)
```pwsh
powershell -command "irm https://malw.ru/dl/malwtool | iex"
```

# Features
## Activation:
* Windows 10/11 all editions, including LTSC (LTSC will be converted to LTSC IoT, which has longer support) via HWID (activation persists after system reinstall)
* Windows 10 LTSC Evaluation -> LTSC (LTSC Evaluation is a trial version available on Microsoft's website. MalwTool can convert it to regular LTSC for activation, point above)
* Windows Server 2022, Windows Server Standard, Windows Server Datacenter, 2019, 2016, 2012, 2012 R2, 1803, 1709 via KMS
* Office 2013, 2016, 2019, 2021, 2024, 365 via sppc.dll
* Visio 2016/2019/2021 -> 2021 (will be converted to 2021) via KMS
* Project 2016/2019/2021 -> 2021 (will be converted to 2021) via KMS
* Prism Launcher (offline account unlock)
* TL (unlock ability to disable ad servers)
* MobaXterm

## Downloads:
* Latest Windows 10 (from official Microsoft website, no bypass for russians needed)
* Windows 10 LTSC 2021 (recommended)
* Latest Windows 11 (from official Microsoft website, no bypass for russians needed)
* Windows 11 LTSC 2024
* Windows 8.1
* Windows Server 2025, 2022, 2019, 2016, 2012
* Rufus
* Office 2024, 2021, 2019, 2016, 2013 (online installer or ISO archive. For online installer, MalwTool helps bypass restrictions for russians)
* Visio 2024 (ISO)
* Project 2024 (ISO)

## Other Functions:
* View saved Wi-Fi passwords
* Install winget
* Install Microsoft Store
* Backup and restore drivers (recommended for reinstalling Windows)
* Complete Microsoft Edge removal
* Remove CompatTelRunner.exe and wsqmcons.exe (system spy files that burden CPU)
* Install Spicetify
* Modify hosts file for bypass restrictions for russians

## Troubleshooting:
* Clean Office16 licenses
* Office removal tool (requires "Get Help" app in Windows)
* Missing Office16 folder
* Reset Windows KMS activation
* System file integrity check (sfc /scannow, DISM /Online /Cleanup-Image /RestoreHealth, chkdsk C: /b /x)

# MalwTool Legacy — for Windows 8/8.1
![Screenshot](https://github.com/ImMALWARE/MalwTool/raw/main/files/screenshot_legacy.png?raw=true)

## Launch
To start, execute the following command. The easiest way is to open Windows search and run it there. You can also run it in Win + R, cmd, PowerShell, or shortcut wizard
```pwsh
powershell -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/MalwToolLegacy.ps1 | iex"
```

## Activation Features:
* Windows 8/8.1
* Office 2016
* Office 2013
* Visio 2016
* Project 2016

# What about Windows 7?
Guides are here: https://github.com/ImMALWARE/MalwTool/wiki/For-Windows-7-(English)

# Questions? Suggestions? Error Reports?
## You can report here:
* [Github Issues](https://github.com/ImMALWARE/MalwTool/issues/new)
* [Telegram Chat](https://t.me/immalware_chat)
* [Lolzteam Thread](https://lolz.live/threads/4997821)