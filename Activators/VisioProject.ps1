$Product = $Product.Replace('Office', '')
Add-Type -AssemblyName System.Windows.Forms

if ($PSUICulture -eq "ru-RU") {
    $strings = @("MalwTool — Активация $Product 2016/2019/2021 через KMS", "не найден!")
} else {
    $strings = @("MalwTool — Activating $Product 2016/2019/2021 via KMS", "not found!")
}

$host.ui.RawUI.WindowTitle = $strings[0]
if (test-path "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs"){
    $path = "$env:ProgramFiles\Microsoft Office\Office16\"
}
elseIf (test-path "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs") {
    $path = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\"
}
else {
    [System.Windows.Forms.MessageBox]::Show("$Product 2016/2019/2021 " + $strings[1], "MalwTool", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    exit
}

Set-Location $path
& "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /inslic:"..\root\Licenses16\pkeyconfig-office.xrm-ms" > $null
Get-ChildItem -Path "..\root\Licenses16\" -Include "client-issuance*.xrm-ms", "$($Product.ToLower())provl_kms*.xrm-ms", "$($Product.ToLower())pro2021vl_kms*.xrm-ms" -Recurse | ForEach-Object { & "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /inslic:"$($_.FullName)" > $null }
& "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /inpkey:$(@{"Visio" = "KNH8D-FGHT4-T8RK3-CTDYJ-K2HT4"; "Project" = "FTNWT-C6WBT-8HMGF-K9PRX-QV9H8"}[$Product]) > $null
& "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /sethst:kms.loli.best > $null
& "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /setprt:1688 > $null
& "$env:SystemRoot\\System32\\cscript.exe" //nologo ospp.vbs /act
pause