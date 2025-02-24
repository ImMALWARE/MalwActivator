# https://github.com/ImMALWARE/MalwTool
$n = [Environment]::NewLine
$tls = '[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12'
$host.ui.RawUI.WindowTitle = 'MalwTool Legacy'
$visproj = @"
    `$host.ui.RawUI.WindowTitle = 'MalwTool — Activating %p%'
    Set-Location '%path%'
    & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /inslic:'..\root\Licenses16\pkeyconfig-office.xrm-ms' > `$null
    Get-ChildItem -Path '..\root\Licenses16\' -Include 'client-issuance*.xrm-ms', 'VisioProVL_KMS*.xrm-ms', 'ProjectProVL_KMS*.xrm-ms' -Recurse | ForEach-Object { & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /inslic:`"`"..\root\Licenses16\`$(`$_.Name)`"`" > `$null }
    & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /inpkey:%key% > `$null
    & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /sethst:kms.loli.best > `$null
    & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /setprt:1688 > `$null
    & '$env:SystemRoot\System32\cscript.exe' //nologo ospp.vbs /act
    pause
"@

while ($true) {
    Write-Host '~~~ MalwTool Legacy ~~~'
    Write-Host "Enter the number of what you need and press Enter:$n 1. Activate Windows 8/8.1$n 2. Activate Office 2016$n 3. Activate Office 2013$n 4. Activate Visio 2016$n 5. Activate Project 2016$n 6. Exit"
    $choice = Read-Host

    switch ($choice) {
        '1' {
            Start-Process powershell -ArgumentList "$tls; irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/Activators/KMS.ps1 | iex" -Verb RunAs
        } '2' {
            if (test-path "$env:ProgramFiles\Microsoft Office\Office16") {
                Start-Process powershell -ArgumentList "`$Product = 'Office2016'; $tls; irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/Activators/Osppcs.ps1 | iex" -Verb RunAs
            } else {
                Write-Host 'Office 2016 not found!'
            }
        } '3' {
            if (test-path "$env:ProgramFiles\Microsoft Office\Office15") {
                Start-Process powershell -ArgumentList "$tls; irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/Activators/Osppcs2013.ps1 | iex" -Verb RunAs
            } else {
                Write-Host 'Office 2013 not found!'
            }
        } '4' {
            if (test-path "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs"){
                $path = "$env:ProgramFiles\Microsoft Office\Office16\"
            }
            elseIf (test-path "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs") {
                $path = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\"
            }
            else {
                Write-Host 'Visio 2016 not found!'
                continue
            }
            Start-Process powershell -ArgumentList $visproj.Replace('%p%', 'Visio 2016').Replace('%path%', $path).Replace('%key%', 'PD3PC-RHNGV-FXJ29-8JK7D-RJRJK') -Verb RunAs
        } '5' {
            if (test-path "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs"){
                $path = "$env:ProgramFiles\Microsoft Office\Office16\"
            }
            elseIf (test-path "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs") {
                $path = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\"
            }
            else {
                Write-Host 'Project 2016 not found!'
                continue
            }
            Start-Process powershell -ArgumentList $visproj.Replace('%p%', 'Project 2016').Replace('%path%', $path).Replace('%key%', 'YG9NW-3K39V-2T3HJ-93F3Q-G83KT') -Verb RunAs
        } '6' {
            exit
        } default {
            continue
        }
    }
}