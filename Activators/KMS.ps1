$host.ui.RawUI.WindowTitle = 'MalwTool — Activating Windows 8/8.1 via KMS'

Set-Location $env:SystemRoot\System32
./cscript.exe //nologo slmgr.vbs /ckms > $null
./cscript.exe //nologo slmgr.vbs /upk > $null
./cscript.exe //nologo slmgr.vbs /cpky > $null
./cscript.exe //nologo slmgr.vbs /ipk 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ > $null # 8 Core Single Language
./cscript.exe //nologo slmgr.vbs /ipk BN3D2-R7TKB-3YPBD-8DRP2-27GG4 > $null # 8 Core
./cscript.exe //nologo slmgr.vbs /ipk 32JNW-9KQ84-P47T8-D8GGY-CWCK7 > $null # 8 Enterprise
./cscript.exe //nologo slmgr.vbs /ipk GNBB8-YVD74-QJHX6-27H4K-8QHDG > $null # 8 Professional WMC
./cscript.exe //nologo slmgr.vbs /ipk NG4HW-VH26C-733KW-K6F98-J8CK4 > $null # 8 Professional
./cscript.exe //nologo slmgr.vbs /ipk BB6NG-PQ82V-VRDPW-8XVD2-V8P66 > $null # 8.1 Core Single Language
./cscript.exe //nologo slmgr.vbs /ipk M9Q9P-WNJJT-6PXPY-DWX8H-6XWKK > $null # 8.1 Core
./cscript.exe //nologo slmgr.vbs /ipk MHF9N-XY6XB-WVXMC-BTDCT-MKKG7 > $null # 8.1 Enterprise
./cscript.exe //nologo slmgr.vbs /ipk 789NJ-TQK6T-6XTH8-J39CJ-J8D3P > $null # 8.1 Professional WMC
./cscript.exe //nologo slmgr.vbs /ipk GCRJD-8NW9H-F2CDX-CCM8D-9D6T9 > $null # 8.1 Professional
./cscript.exe //nologo slmgr.vbs /skms kms.loli.best > $null
./cscript.exe //nologo slmgr.vbs /ato
pause