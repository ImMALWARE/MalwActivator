if ($PSUICulture -eq "ru-RU") {$host.ui.RawUI.WindowTitle = 'MalwTool — Активация Windows Server через KMS'}
else {$host.ui.RawUI.WindowTitle = 'MalwTool — Activating Windows Server via KMS'}

Set-Location $env:SystemRoot\System32
./cscript.exe //nologo slmgr.vbs /ckms > $null
./cscript.exe //nologo slmgr.vbs /upk > $null
./cscript.exe //nologo slmgr.vbs /cpky > $null

./cscript.exe //nologo slmgr.vbs /ipk D2N9P-3P6X9-2R39C-7RTCD-MDVJX > $null # Windows Server 2012 R2 Standard
./cscript.exe //nologo slmgr.vbs /ipk W3GGN-FT8W3-Y4M27-J84CP-Q3VJ9 > $null # Windows Server 2012 R2 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk KNC87-3J2TX-XB4WP-VCPJV-M4FWM > $null # Windows Server 2012 R2 Essentials
./cscript.exe //nologo slmgr.vbs /ipk 2WN2H-YGCQR-KFX6K-CD6TF-84YXQ > $null # Windows Server 2012 Single Language
./cscript.exe //nologo slmgr.vbs /ipk 4K36P-JN4VD-GDC6V-KDT89-DYFKP > $null # Windows Server 2012 Country Specific
./cscript.exe //nologo slmgr.vbs /ipk HM7DN-YVMH3-46JC3-XYTG7-CYQJJ > $null # Windows Server 2012 MultiPoint Standard
./cscript.exe //nologo slmgr.vbs /ipk XNH6W-2V9GX-RGJ4K-Y8X6F-QGJ2G > $null # Windows Server 2012 MultiPoint Premium
./cscript.exe //nologo slmgr.vbs /ipk 48HP8-DN98B-MYWDG-T2DCC-8W83P > $null # Windows Server 2012 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk HTDQM-NBMMG-KGYDT-2DTKT-J2MPV > $null # Windows Server 2012 Essentials
./cscript.exe //nologo slmgr.vbs /ipk BN3D2-R7TKB-3YPBD-8DRP2-27GG4 > $null # Windows Server 2012
./cscript.exe //nologo slmgr.vbs /ipk XC9B7-NBPP2-83J2H-RHMBY-92BT4 > $null # Windows Server 2012 Standard

./cscript.exe //nologo slmgr.vbs /ipk CB7KF-BWN84-R7R2Y-793K2-8XDDG > $null # Windows Server 2016 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk JCKRF-N37P4-C2D82-9YXRT-4M63B > $null # Windows Server 2016 Essentials
./cscript.exe //nologo slmgr.vbs /ipk WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY > $null # Windows Server 2016 Standard

./cscript.exe //nologo slmgr.vbs /ipk 6Y6KB-N82V8-D8CQV-23MJW-BWTG6 > $null # Windows Server 1709 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk DPCNP-XQFKJ-BJF7R-FRC8D-GF6G4 > $null # Windows Server 1709 Standard

./cscript.exe //nologo slmgr.vbs /ipk 2HXDN-KRXHB-GPYC7-YCKFJ-7FVDG > $null # Windows Server 1803 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk PTXN8-JFHJM-4WC78-MPCBR-9W4KR > $null # Windows Server 1803 Standard

./cscript.exe //nologo slmgr.vbs /ipk WMDGN-G9PQG-XVVXX-R3X43-63DFG > $null # Windows Server 2019 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk WVDHN-86M7X-466P6-VHXV7-YY726 > $null # Windows Server 2019 Essentials
./cscript.exe //nologo slmgr.vbs /ipk N69G4-B89J2-4G8F4-WWYCC-J464C > $null # Windows Server 2019 Standard

./cscript.exe //nologo slmgr.vbs /ipk 6NMRW-2C8FM-D24W7-TQWMY-CWH2D > $null # Windows Server Datacenter
./cscript.exe //nologo slmgr.vbs /ipk N2KJX-J94YW-TQVFB-DG9YT-724CC > $null # Windows Server Standard

./cscript.exe //nologo slmgr.vbs /ipk WX4NM-KYWYW-QJJR4-XV3QB-6VM33 > $null # Windows Server 2022 Datacenter
./cscript.exe //nologo slmgr.vbs /ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H > $null # Windows Server 2022 Standard

./cscript.exe //nologo slmgr.vbs /skms kms8.msguides.com > $null
./cscript.exe //nologo slmgr.vbs /ato
pause