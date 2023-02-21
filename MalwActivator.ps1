# Source: https://github.com/ImMALWARE/MalwActivator/
# Made by MALWARE (https://malw.ru/pages/contacts)
Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '[DllImport("Kernel32.dll")]public static extern IntPtr GetConsoleWindow();[DllImport("user32.dll")]public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
[void][Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
[System.Windows.Forms.Application]::EnableVisualStyles()
$form = New-Object System.Windows.Forms.Form -Property @{Text = "MalwActivator: Choosing application for activation"; Width = 400; Height = 150}
$form.Controls.Add((New-Object System.Windows.Forms.Label -Property @{ Location = '13,13'; Size = '275,25'; Text = 'Version 1.0
Choose application for activation:'}))
$combo = New-Object System.Windows.Forms.ComboBox -Property @{Location = New-Object System.Drawing.Point(13,40); Size = New-Object System.Drawing.Size(275,20); DropDownStyle = [System.Windows.Forms.ComboBoxStyle]'DropDownList'}
$combo.Items.AddRange(@("Windows 10/11", "Windows 10 LTSC 2021", "Office 2021", "Office 2019", "Office 2016", "Office 2013", "Visio 2021", "Visio 2019", "Visio 2016", "Project 2021", "Project 2019", "Project 2016", "Remove all Office16 licenses"))
$form.Controls.Add($combo)
$button = New-Object System.Windows.Forms.Button -Property @{ Location = New-Object System.Drawing.Point(13,65); Size = New-Object System.Drawing.Size(75,23); Text = "Activate!"; DialogResult = [System.Windows.Forms.DialogResult]::OK }
$form.AcceptButton = $button
$form.Controls.Add($button)
$form.Add_Shown({$form.Activate()})
$Form.StartPosition = 'CenterScreen'
$result = $form.ShowDialog()
if ($result -ne [System.Windows.Forms.DialogResult]::OK) { exit }
$ver = $combo.SelectedItem

switch ($ver) {
    "Windows 10/11" {
        $tmpFile = [System.IO.Path]::Combine($env:Temp, 'malwactivator.bat')
        Set-Content $tmpFile -Value "@echo off
        title MalwActivator: $ver
        Echo Activating $ver, please wait...
        cd C:\Windows\System32
        cscript //nologo slmgr.vbs /ckms >nul
        cscript //nologo slmgr.vbs /upk >nul
        cscript //nologo slmgr.vbs /cpky >nul
        cscript //nologo slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul
        cscript //nologo slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul
        cscript //nologo slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
        cscript //nologo slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul
        cscript //nologo slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul
        cscript //nologo slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul
        cscript //nologo slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul
        cscript //nologo slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul
        cscript //nologo slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul
        cscript //nologo slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul
        cscript //nologo slmgr.vbs /skms kms8.msguides.com >nul
        cscript //nologo slmgr.vbs /ato
        pause"
        Start-Process -FilePath $tmpFile -Verb RunAs -Wait
        exit
    }
    "Windows 10 LTSC 2021" {
        $tmpFile = [System.IO.Path]::Combine($env:Temp, 'malwactivator.bat')
        Set-Content $tmpFile -Value "@echo off
        title MalwActivator: $ver
        Echo Activating $ver, please wait...
        cd C:\Windows\System32
        cscript //nologo slmgr.vbs /ckms >nul
        cscript //nologo slmgr.vbs /upk >nul
        cscript //nologo slmgr.vbs /cpky >nul
        cscript //nologo slmgr.vbs /ipk M7XTQ-FN8P6-TTKYV-9D4CC-J462D >nul
        cscript //nologo slmgr.vbs /skms kms.msgang.com >nul
        cscript //nologo slmgr.vbs /ato
        pause"
        Start-Process -FilePath $tmpFile -Verb RunAs -Wait
        exit
    }
    "Office 2013" {
        $tmpFile = [System.IO.Path]::Combine($env:Temp, 'malwactivator.bat')
        if (test-path "C:\Program Files\Microsoft Office\Office15\ospp.vbs"){ 
            $folder = "C:\Program Files\Microsoft Office\Office15"
        }
        elseIf (test-path "C:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs") {
            $folder = "C:\Program Files (x86)\Microsoft Office\Office15"
        }
        else { 
            [System.Windows.Forms.MessageBox]::Show("$ver not found!","MalwActivator",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)
            exit
        }
        New-Item -ItemType Directory -Path "$env:temp\malwactivator"
        Invoke-WebRequest -Uri "https://github.com/ImMALWARE/MalwActivator/raw/main/files/Office_2013_Library.zip" -OutFile $env:temp\malwactivator\library.zip
        Expand-Archive -Path "$env:temp\malwactivator\library.zip" -DestinationPath "$env:temp\malwactivator\"  
        Set-Content $tmpFile -Value "@echo off
        title MalwActivator: $ver
        Echo Activating $ver, please wait...
        cd /d %temp%\malwactivator\library
        (for /f %%x in ('dir /b *') do cscript `"$folder\ospp.vbs`" /inslic:%%x) > nul
        cscript `"$folder\ospp.vbs`" /inpkey:YC7DK-G2NP3-2QQC3-J6H88-GVGXT >nul
        cscript `"$folder\ospp.vbs`" /sethst:kms8.msguides.com >nul
        cscript `"$folder\ospp.vbs`" /setprt:1688 >nul
        cscript //nologo `"$folder\ospp.vbs`" /act
        pause"
        Start-Process -FilePath $tmpFile -Verb RunAs -Wait
        exit
    }
    "Remove all Office16 licenses" {
        if (test-path "C:\Program Files\Microsoft Office\Office16\ospp.vbs"){ 
            $path = "C:\Program Files\Microsoft Office\Office16\"
        }
        elseIf (test-path "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs") {
            $path = "C:\Program Files (x86)\Microsoft Office\Office16\"
        }
        else { 
            [System.Windows.Forms.MessageBox]::Show("Office16 folder not found!","MalwActivator",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)
            exit
        }
        Start-Process -FilePath powershell.exe -ArgumentList "-Command `"`$host.ui.RawUI.WindowTitle = 'MalwActivator: Removing all Office16 licenses';cd '$path';while(`$true){`$license = (cscript ospp.vbs /dstatus) | Out-String;`$match = `$license | Select-String -Pattern 'Last 5 characters of installed product key: (\w{5})';if (`$match) {`$productKey = `$match.Matches.Groups[1].Value;cscript ospp.vbs /unpkey:`$productKey}else{exit}}`"" -Verb RunAs -Wait
        [System.Windows.Forms.MessageBox]::Show("All Office16 licenses have been removed.","MalwActivator",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Information)
        exit
        }
}

if ($ver -like "* *") {
    if (test-path "C:\Program Files\Microsoft Office\Office16\ospp.vbs"){ 
        $path = "C:\Program Files\Microsoft Office\Office16\"
    }
    elseIf (test-path "C:\Program Files (x86)\Microsoft Office\Office16\ospp.vbs") {
        $path = "C:\Program Files (x86)\Microsoft Office\Office16\"
    }
    else { 
        [System.Windows.Forms.MessageBox]::Show("$ver not found!","MalwActivator",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Error)
        exit
    }
    switch ($ver) {
        "Office 2021" {
            $lic = "for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript //nologo ospp.vbs /unpkey:6F7TH >nul
                    cscript //nologo ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH >nul"
        }
        "Office 2019" {
            $lic = "for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /unpkey:6MWKP >nul
                cscript ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul"
        }
        "Office 2016" {
            $lic = "for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /unpkey:BTDRB >nul
                cscript ospp.vbs /unpkey:KHGM9 >nul
                cscript ospp.vbs /unpkey:CPQVG >nul
                cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul"
        }
        "Visio 2021" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\visioprovl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\visiopro2021vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /inpkey:KNH8D-FGHT4-T8RK3-CTDYJ-K2HT4>nul"
        }
        "Visio 2019" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\visioprovl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\visiopro2019vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /inpkey:9BGNQ-K37YR-RQHF2-38RQ3-7VCBB>nul"
        }
        "Visio 2016" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\VisioProVL_KMS_Client-ppd.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\VisioProVL_KMS_Client-ul-oob.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\VisioProVL_KMS_Client-ul.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-bridge-office.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-root.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-root-bridge-test.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-stil.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-ul.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-ul-oob.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul"
            $key = "cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK>nul"
        }
        "Project 2021" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\projectprovl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\projectpro2021vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /inpkey:FTNWT-C6WBT-8HMGF-K9PRX-QV9H8>nul"
        }
        "Project 2019" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\client-issuance*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\projectprovl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul
                for /f %%x in ('dir /b ..\root\Licenses16\projectpro2019vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:`"..\root\Licenses16\%%x`" >nul"
            $key = "cscript ospp.vbs /inpkey:B4NPR-3FKK7-T2MBV-FRQ4W-PKD2B>nul"
        }
        "Project 2016" {
            $lic = "cscript ospp.vbs /inslic:`"..\root\Licenses16\ProjectProVL_KMS_Client-ppd.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\ProjectProVL_KMS_Client-ul-oob.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\ProjectProVL_KMS_Client-ul.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-bridge-office.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-root.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-root-bridge-test.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-stil.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-ul.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\client-issuance-ul-oob.xrm-ms`" >nul
                cscript ospp.vbs /inslic:`"..\root\Licenses16\pkeyconfig-office.xrm-ms`" >nul"
            $key = "cscript ospp.vbs /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT"
        }
    }   
    $tmpFile = [System.IO.Path]::Combine($env:Temp, 'malwactivator.bat')
    Set-Content $tmpFile -Value "@echo off
        title MalwActivator: $ver
        Echo Activating $ver, please wait...
        cd $path
        $lic
        cscript //nologo ospp.vbs /setprt:1688 >nul
        $key
        set i=1
        :skms
        if %i% GTR 10 goto busy
        if %i% EQU 1 set KMS=e8.us.to
        if %i% EQU 2 set KMS=kms8.MSGuides.com
        if %i% EQU 3 set KMS=s9.us.to
        if %i% GTR 3 goto ato
        cscript //nologo ospp.vbs /sethst:%KMS% >nul
        :ato
        cscript //nologo ospp.vbs /act | find /i `"successful`" && (echo $ver is activated! Press any key to exit!&pause>nul&exit) || (echo Failed to connect to server. Connecting to another server.&set /a i+=1 & goto skms)
        :busy
        echo Failed to connect to every server :("
    Start-Process -FilePath $tmpFile -Verb RunAs -Wait
}
else {
    [System.Windows.Forms.MessageBox]::Show("Ok, I did activate nothing.","MalwActivator",[System.Windows.Forms.MessageBoxButtons]::OK,[System.Windows.Forms.MessageBoxIcon]::Information)
    exit
}