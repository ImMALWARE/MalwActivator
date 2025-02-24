# https://github.com/ImMALWARE/MalwTool
Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '[DllImport("Kernel32.dll")]public static extern IntPtr GetConsoleWindow();[DllImport("user32.dll")]public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'
[void][Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
[System.Windows.Forms.Application]::EnableVisualStyles()
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$wc = New-Object net.webclient
$mb = [System.Windows.Forms.MessageBox]::Show
$app = 'MalwTool'
$n = [Environment]::NewLine
$hidden = New-Object System.Windows.Forms.Form -Property @{
    TopMost = $true
    WindowState = "Minimized"
}

if ($PSUICulture -eq "ru-RU") {
    $strings = @("Активация",
    "Скачивание",
    "Другие функции",
    "Решение проблем",
    "Информация",
    "Активация Windows 10 или 11 (в том числе LTSC) по HWID",
    "Конвертировать пробную версию Windows 10 LTSC (Evaluation) в полноценную LTSC",
    "Активация Windows Server 2022, Windows Server Standard, Windows Server Datacenter, 2019, 2016, 2012, 2012 R2, 1803, 1709",
    "Через KMS, будет активирован как %p% 2021 (более старые версии обновятся)",
    ("Активация Office %v% путём добавления файла sppc.dll$n" + "%info%" + "Активация сработает и для Office %otherv%. Office потом автоматически конвертируется в %v%."),
    "Office 365 — всегда самая актуальная версия Office, лучше выбрать этот вариант.$n",
    "И всё-таки, я бы порекомендовал выбрать Office 365.$n",
    "Активация Office 2013 с помощью добавления файла sppc.dll",
    ("Разрешить создание автономного аккаунта Minecraft в Prism Launcher без добавления аккаунта Microsoft.$n" + "Не запускайте, если вы уже добавили аккаунт! Это действие удалит все аккаунты в лаунчере!"),
    "Премиум-аккаунт в TL, вы сможете отключить добавление рекламных серверов в его настройках",
    "Автономный аккаунт в Prism Launcher разблокирован!",
    "%p% не найден!",
    "Premium аккаунт в TL активирован! Теперь зайдите в настройки TL для отключения рекламных серверов!",
    "Ни один аккаунт не доблавен в TL!",
    "ISO образ последней версии Windows %v% с официального сайта Microsoft",
    "Онлайн-установщик Office с официального сайта Microsoft.",
    "ISO архив Office с официального сайта Microsoft. Запустите в нём setup.exe",
    " Следуйте инструкциям $app после запуска установщика.",
    "Не рекомендуется, устаревшая версия. ",
    "инструмент для записи ISO образов на флешку",
    "Не удалось получить ссылку для загрузки! Попробовать снова?",
    "Скачанному файлу нужно будет дописать формат .iso!",
    "рекомендуется",
    'Для онлайн-установки нужно обойти гео-ограничения. Для этого: запустите exe-файл, дождитесь ошибки "Сбой установки", нажмите "Да" в этом окне. После этого перезапустите файл установщика!',
    "Узнать пароли от сохранённых Wi-Fi сетей",
    "Перед запуском убедитесь, что Wi-Fi сейчас включен",
    "Отображать расширения файлов в проводнике",
    "Установить ",
    "Для LTSC-версий Windows без установленного Microsoft Store",
    "Резервное копирование драйверов",
    'Перед переустановкой Windows лучше сделать резервную копию всех драйверов, чтобы потом не мучаться с ними после переустановки, а просто выбрать "Восстановление" здесь',
    "Восстановление драйверов",
    "Полностью удалить Microsoft Edge",
    "Удалить системные шпионские программы",
    "Удалить CompatTelRunner.exe и wsqmcons.exe",
    "Установить Spicetify",
    "Модификация приложения Spotify",
    "Обойти гео-ограничения веб-сервисов",
    ("Обойти гео-ограничения через редактирование файла hosts$n" + "Будут работать ChatGPT, Gemini, NotebookLM, Copilot, Spotify, Codeium, GitHub Copilot, Claude, Notion, Canva, TikTok$n" + "Без VPN и других сторонних приложений"),
    "Выберите директорию, куда будет сохранена резервная копия драйверов",
    "Выберите директорию с резервной копией драйверов",
    "Очистить лицензии Office16",
    "Только для KMS активации. Не очистит активацию от $app.",
    "Инструмент удаления Office",
    "Сброс KMS-активации Windows",
    "Проверить системные файлы на целостность",
    "Через 60 секунд будет перезагрузка для проверки системного диска!",
    "Отсутствует папка Office16",
    "Проверка системы",
    "У меня другая проблема!",
    "Даже если проблема не связана с $app, всё равно напишите",
    "Папка Office16 не найдена!",
    "убираю лицензии Office16",
    "Очищаю активацию Windows",
    "Выберите путь к Telegram.exe",
    "Статья на Malw.ru",
    "Тема на Lolzteam",
    "Есть вопросы? ",
    "Написать в Telegram",
    "Написать в теме Lolzteam",
    "Написать в GitHub Issues",
    "Активировать!",
    "https://drive.massgrave.dev/ru-ru_windows_10_enterprise_ltsc_2021_x64_dvd_5044a1e7.iso",
    "https://drive.massgrave.dev/ru-ru_windows_11_enterprise_ltsc_2024_x64_dvd_f9af5773.iso",
    "https://oemsoc.download.prss.microsoft.com/dbazure/X23-81967_26100.1742.240906-0331.ge_release_svc_refresh_SERVER_OEMRET_x64FRE_ru-ru.iso_0400d135-3d94-49a2-8627-8f1a8cb316bf?t=27afd6c5-3c63-4984-8139-b9c239276cb4&P1=102817441539&P2=601&P3=2&P4=K6P6PaBziMqVvDg7AgCqTBprjEMuo%2bmjluaix%2b9TaUldONUCc3PtGs30Rvmn3IKMuSZ7kcmGydK%2bmz38quTSTCyGmjPdKm6bLG%2f2m13pTKsdD1zp%2flccTbTkwvIN%2fdhU8qzwet9V56is8W7o7IykKbczeFlJ1yQV7xq6OCpOzudqomW5fUsUO0%2fRx%2b78zkGgyrHlxIQlX9bAC5Fr069%2byhr5OiXWk9R%2fzEj93%2bEfBrZMTFz1M%2fzf6UKw6tYjOjdSJkNKk%2bhjnAyC%2bcqCj2OKrw6yhEJ6vtXbNJomDZzfUBqMM%2f1uoRabPzPv5Adp3XEJ5DIzdBU%2foyhPbj0qcCzfPg%3d%3d",
    "https://drive.massgrave.dev/ru-ru_windows_server_2022_updated_nov_2024_x64_dvd_4e34897c.iso",
    "https://drive.massgrave.dev/ru-ru_windows_server_2019_x64_dvd_e02b76ba.iso",
    "https://drive.massgrave.dev/ru_windows_server_2016_vl_x64_dvd_11636694.iso",
    "https://drive.massgrave.dev/ru_windows_server_2012_r2_vl_with_update_x64_dvd_6052827.iso",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2024Retail&platform=x64&language=ru-ru&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/ProPlus2024Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2021Retail&platform=x64&language=ru-ru&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/ProPlus2021Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2019Retail&platform=x64&language=ru-ru&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/ProPlus2019Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlusRetail&platform=x64&language=ru-ru&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/ProPlusRetail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlusRetail&platform=x64&language=ru-ru&version=O15GA",
    "https://officecdn.microsoft.com/db/39168d7e-077b-48e7-872c-b232c3e72675/media/ru-ru/ProfessionalRetail.img",
    "Нужно, чтобы приложение Техническая поддержка (Get Help) было установлено! Выберите Да и дождитесь завершения процесса",
    "https://drive.massgrave.dev/ru_windows_8.1_pro_vl_with_update_x64_dvd_6050899.iso",
    "Теперь снова запустите установщик Office!",
    "Папка на месте!",
    "⚠!!! Сейчас нажмите Y и Enter для проверки диска!!!",
    "Microsoft Store устанавливается! Подождите пару минут, и он должен появиться в Пуске!",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/VisioPro2024Retail.img",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/ru-ru/ProjectPro2024Retail.img",
    "Резервная копия драйверов",
    "Восстановление драйверов",
    "Удаление CompatTelRunner.exe и wsqmcons.exe",
    "Редактирую hosts файл",
    "Скачиваю папку Office16")
} else {
    $strings = @("Activation",
    "Download",
    "Other functions",
    "Troubleshooting",
    "Info",
    "Windows 10 or 11 (including LTSC) activation by HWID",
    "Convert evaluation version of Windows 10 LTSC to full LTSC",
    "Activation of Windows Server 2022, Windows Server Standard, Windows Server Datacenter, 2019, 2016, 2012, 2012 R2, 1803, 1709",
    "Via KMS, will be activated as %p% 2021 (older versions will be updated)",
    ("Office %v% activation via sppc.dll file$n" + "%info%" + "The activation will also work for Office %otherv%. Office will then be automatically converted to %v%."),
    "Office 365 is always the latest version of Office, it is better to choose this option.$n",
    "Anyway, I would recommend selecting Office 365.$n",
    "Office 2013 activation via sppc.dll file.",
    ("Allow creation of an offline Minecraft account in Prism Launcher without Microsoft account.$n" + "Do not start if you have already added an account! This action will delete all accounts in the launcher!"),
    "Premium account in TL, you will be able to disable adding advertised servers in its settings",
    "Offline account in Prism Launcher unlocked!",
    "%p% not found!",
    "Premium account in TL is activated! Now open its settings to disable advertised servers!",
    "No account has been added to TL!",
    "ISO image of the latest version of Windows %v% from the official Microsoft website",
    "Office online installer from the official Microsoft website.",
    "ISO archive of Office from the official Microsoft website. Run setup.exe in it.",
    " Follow the instructions of $app after starting the installer.",
    "Not recommended, outdated version. ",
    "tool for writing ISO images to a flash drive",
    "Failed to get a download link! Try again?",
    "Downloaded file needs to be appended with .iso!",
    "recommended",
    'To install online, you need to bypass geo-restrictions. To do this: run the exe-file, wait for the "Command not supported" error, click "Yes" in this window. After this, restart the installer file!',
    "Get passwords from saved Wi-Fi networks",
    "Before starting, make sure that Wi-Fi is currently enabled",
    "Show file extensions in the explorer",
    "Install ",
    "For LTSC versions of Windows without installed Microsoft Store!",
    "Backup drivers",
    ("Before reinstalling Windows, it's best to back up all drivers so you don't have to struggle with them afterward—just select " + '"restore" here.'),
    "Restore drivers",
    "Completely uninstall Microsoft Edge",
    "Delete system spy programs",
    "Delete CompatTelRunner.exe and wsqmcons.exe",
    "Install Spicetify",
    "Spotify mod",
    "Bypass web-apps geo-blocking",
    ("Bypass geo-restrictions via editing hosts file$n" + "The following services will work: ChatGPT, Gemini, NotebookLM, Copilot, Spotify, Codeium, GitHub Copilot, Claude, Notion, Canva, TikTok$n" + "Without VPN and other apps"),
    "Select directory for drivers backup",
    "Select directory with drivers backup",
    "Clear Office16 licenses",
    "Only for KMS activation, won't clear activation from $app",
    "Office uninstall tool",
    "Clear Windows KMS-activation",
    "Check system files for integrity",
    "In 60 seconds there will be a reboot to check the system disk!",
    "Office16 folder is missing",
    "Checking system",
    "I have another problem!",
    "Contact me, even if the problem is unrelated to $app",
    "Office16 folder not found!",
    "removing Office16 licenses",
    "Clearing Windows activation",
    "Select path to Telegram.exe",
    "Post on Malw.ru",
    "Lolzteam thread",
    "Questions? ",
    "Message in Telegram",
    "Write in Lolzteam thread",
    "Write in GitHub Issues",
    "Activate!",
    "https://drive.massgrave.dev/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso",
    "https://drive.massgrave.dev/en-us_windows_11_iot_enterprise_ltsc_2024_x64_dvd_f6b14814.iso",
    "https://oemsoc.download.prss.microsoft.com/dbazure/X23-81958_26100.1742.240906-0331.ge_release_svc_refresh_SERVER_OEMRET_x64FRE_en-us.iso_909fa35d-ba98-407d-9fef-8df76f75e133?t=34b8db0f-439b-497c-86ce-ec7ceb898bb7&P1=102816956391&P2=601&P3=2&P4=pG1WoVpBKlyWcmfj%2bt1gYgkTsP4At28ch8mG7vIQm%2fT4elz5v2ZQ3eKAN8%2fFjb1yaa4npBaABURtnI8YmrDv8p0VJmYpLCIUQ0FHEFR4IFiPgtvzwAAI8oNdiEl%2b2uM7MN8Gaju8BvIVgHRl%2fRxq0HFgrFoEGmvHZU4jY0RFsYAaHliUinDUzdVfT0IPwyWqNUJXZTSfguyphv8XZx8OQsBy3zwBp7tNHsKl36ZO2JdZK%2fyPY7QTpAr5ccazUPEa40ALhYRBJXxlQb1F0OeO7kHhW7DKK5D4Wpt5WbpjFn8MqcZBX3%2fQI6WAwzDSKIck7jYL7bYdl2ufoMRrFZrxxw%3d%3d",
    "https://drive.massgrave.dev/en-us_windows_server_2022_updated_nov_2024_x64_dvd_4e34897c.iso",
    "https://drive.massgrave.dev/en-us_windows_server_2019_x64_dvd_f9475476.iso",
    "https://drive.massgrave.dev/en_windows_server_2016_vl_x64_dvd_11636701.iso",
    "https://drive.massgrave.dev/en_windows_server_2012_r2_vl_with_update_x64_dvd_6052766.iso",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2024Retail&platform=x64&language=en-us&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2024Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2021Retail&platform=x64&language=en-us&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2021Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlus2019Retail&platform=x64&language=en-us&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlus2019Retail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlusRetail&platform=x64&language=en-us&version=O16GA",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProPlusRetail.img",
    "https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=ProPlusRetail&platform=x64&language=en-us&version=O15GA",
    "https://officecdn.microsoft.com/db/39168d7e-077b-48e7-872c-b232c3e72675/media/en-us/ProfessionalRetail.img",
    "You will need Get Help app installed! When it opens, select Yes and wait for it to complete!",
    "https://drive.massgrave.dev/en-gb_windows_8.1_pro_vl_with_update_x64_dvd_6050881.iso",
    "Now start Office setup again!",
    "Folder already exists!",
    "⚠!!! Now press Y and Enter for checking disk!!!",
    "Microsoft Office is installing! Wait a few minutes, it will appear in Start!",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/VisioPro2024Retail.img",
    "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-us/ProjectPro2024Retail.img",
    "Backup drivers",
    "Restore drivers",
    "Deleting CompatTelRunner.exe and wsqmcons.exe",
    "Editing hosts file",
    "Downloading Office16 folder")
}
$gstrings = @("irm https://raw.githubusercontent.com/ImMALWARE/$app/main/Activators", " | iex", "$env:ProgramFiles\Microsoft Office\root\vfs\System")
$activators = @{"Win10" = "HWID.ps1"; "ConvertEvaluationToFull" = "LTSCEvaluationToFull.ps1"; "WinServer" = "ServerKMS.ps1"; "OfficeVisio" = "VisioProject.ps1"; "OfficeProject" = "VisioProject.ps1"; "MobaXterm" = "MXT.ps1"; "Office 365" = "Osppcs.ps1"; "Office 2024" = "Osppcs.ps1"; "Office 2021" = "Osppcs.ps1"; "Office 2019" = "Osppcs.ps1"; "Office 2016" = "Osppcs.ps1"; "Office 2013" = "Osppcs2013.ps1"}
$paths = @{"Office 365" = $gstrings[2]; "Office 2024" = $gstrings[2]; "Office 2021" = $gstrings[2]; "Office 2019" = $gstrings[2]; "Office 2016" = $gstrings[2]; "Office 2013" = "$env:ProgramFiles\Microsoft Office 15\root\vfs\System"; "Prism Launcher" = "$env:appdata\PrismLauncher"; "TL" = "$env:appdata\.minecraft\TlauncherProfiles.json"; "MobaXterm" = "${env:ProgramFiles(x86)}\Mobatek\MobaXterm\version.dat"}

function check_path ($path, $prod) {
    if (Test-Path $path) {
        return $true
    } else {
        $null = $mb.Invoke($strings[16].Replace('%p%', $prod))
        return $false
    }
}

$form = New-Object System.Windows.Forms.Form -Property @{
    StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
    FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
    MaximizeBox = $false
    Text = $app
    ClientSize = [System.Drawing.Size]::new(627, 234)
    Font = [System.Drawing.Font]::new('Segoe UI', 8.5)
}

$tabs = New-Object System.Windows.Forms.TabControl -Property @{
    Dock = [System.Windows.Forms.DockStyle]::Fill
    Location = [System.Drawing.Point]::new(0, 0)
    SelectedIndex = 0
    Size = [System.Drawing.Size]::new(627, 234)
    SizeMode = [System.Windows.Forms.TabSizeMode]::FillToRight
}

$ActTab = New-Object System.Windows.Forms.TabPage -Property @{
    Location = [System.Drawing.Point]::new(4, 24)
    Padding = [System.Windows.Forms.Padding]::new(3)
    Size = [System.Drawing.Size]::new(619, 206)
    Text = $strings[0]
}

$DlTab = New-Object System.Windows.Forms.TabPage -Property @{
    Location = [System.Drawing.Point]::new(4, 24)
    Padding = [System.Windows.Forms.Padding]::new(3)
    Size = [System.Drawing.Size]::new(619, 206)
    Text = $strings[1]
}

$FunctionsTab = New-Object System.Windows.Forms.TabPage -Property @{
    Location = [System.Drawing.Point]::new(4, 24)
    Size = [System.Drawing.Size]::new(619, 206)
    Text = $strings[2]
}

$ProblemsTab = New-Object System.Windows.Forms.TabPage -Property @{
    Location = [System.Drawing.Point]::new(4, 24)
    Padding = [System.Windows.Forms.Padding]::new(3)
    Size = [System.Drawing.Size]::new(619, 206)
    Text = $strings[3]
}

$InfoTab = New-Object System.Windows.Forms.TabPage -Property @{
    Location = [System.Drawing.Point]::new(4, 24)
    Size = [System.Drawing.Size]::new(619, 206)
    Text = $strings[4]
}

@($ActTab, $DlTab, $FunctionsTab, $ProblemsTab, $InfoTab) | ForEach-Object { $tabs.TabPages.Add($_) }

$tooltip = New-Object System.Windows.Forms.ToolTip -Property @{
    AutoPopDelay = 5000
    InitialDelay = 5
    ReshowDelay = 100
    ShowAlways = $true
}

# Activation tab

$ActWin10 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Checked = $true
    Location = [System.Drawing.Point]::new(6, 6)
    Name = "Win10"
    Size = [System.Drawing.Size]::new(143, 19)
    TabStop = $true
    Text = "Windows 10/11 (HWID)"
}
$tooltip.SetToolTip($ActWin10, $strings[5])

$ConvertEvaluationToFull = New-Object System.Windows.Forms.RadioButton -Property @{ 
    AutoSize = $true
    Location = [System.Drawing.Point]::new(6, 31)
    Name = "ConvertEvaluationToFull"
    Size = [System.Drawing.Size]::new(130, 19)
    Text = "LTSC Evaluation -> LTSC"
}
$tooltip.SetToolTip($ConvertEvaluationToFull, $strings[6])

$ActWinServer = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(6, 56)
    Name = "WinServer"
    Size = [System.Drawing.Size]::new(193, 19)
    Text = "Windows Server 2022/2019/2016"
}
$tooltip.SetToolTip($ActWinServer, $strings[7])

$ActVisio = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(6, 106)
    Name = "OfficeVisio"
    Size = [System.Drawing.Size]::new(54, 19)
    Text = "Visio 2016/2019/2021"
}
$tooltip.SetToolTip($ActVisio, $strings[8].Replace("%p%", "Visio"))

$ActProject = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(6, 131)
    Name = "OfficeProject"
    Size = [System.Drawing.Size]::new(64, 19)
    Text = "Project 2016/2019/2021"
}
$tooltip.SetToolTip($ActProject, $strings[8].Replace("%p%", "Project"))

$ActOffice365 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 6)
    Name = "Office 365"
    Size = [System.Drawing.Size]::new(79, 19)
    Text = "Office 365"
}
$tooltip.SetToolTip($ActOffice365, $strings[9].Replace("%v%", "365").Replace("%info%", $strings[10]).Replace("%otherv%", "2016, 2019, 2021, 2024"))

$ActOffice2024 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 31)
    Name = "Office 2024"
    Size = [System.Drawing.Size]::new(83, 19)
    Text = "Office 2024"
}
$tooltip.SetToolTip($ActOffice2024, $strings[9].Replace("%v%", "2024").Replace("%info%", $strings[11]).Replace("%otherv%", "2016, 2019, 2021"))

$ActOffice2021 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 56)
    Name = "Office 2021"
    Size = [System.Drawing.Size]::new(83, 19)
    Text = "Office 2021"
}
$tooltip.SetToolTip($ActOffice2021, $strings[9].Replace("%v%", "2021").Replace("%info%", "").Replace("%otherv%", "2016, 2019, 2024"))

$ActOffice2019 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 81)
    Name = "Office 2019"
    Size = [System.Drawing.Size]::new(84, 19)
    Text = "Office 2019"
}
$tooltip.SetToolTip($ActOffice2019, $strings[9].Replace("%v%", "2019").Replace("%info%", "").Replace("%otherv%", "2016, 2021, 2024"))

$ActOffice2016 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 106)
    Name = "Office 2016"
    Size = [System.Drawing.Size]::new(84, 19)
    Text = "Office 2016"
}
$tooltip.SetToolTip($ActOffice2016, $strings[9].Replace("%v%", "2016").Replace("%info%", "").Replace("%otherv%", "2019, 2021, 2024"))

$ActOffice2013 = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(214, 131)
    Name = "Office 2013"
    Size = [System.Drawing.Size]::new(83, 19)
    Text = "Office 2013"
}
$tooltip.SetToolTip($ActOffice2013, $strings[12])

$ActPrismLauncher = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(373, 6)
    Name = "Prism Launcher"
    Size = [System.Drawing.Size]::new(201, 19)
    Text = "Prism Launcher"
}
$tooltip.SetToolTip($ActPrismLauncher, $strings[13])

$ActTL = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(373, 31)
    Name = "TL"
    Size = [System.Drawing.Size]::new(81, 19)
    Text = "TL"
}
$tooltip.SetToolTip($ActTL, $strings[14])

$ActMXT = New-Object System.Windows.Forms.RadioButton -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(373, 56)
    Name = "MobaXterm"
    Size = [System.Drawing.Size]::new(88, 19)
    Text = "MobaXterm"
}

$Act = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(515, 169)
    Size = [System.Drawing.Size]::new(96, 23)
    Text = $strings[66]
}


$Act.Add_Click({
    $prod = ($ActTab.Controls | Where-Object { $_.GetType() -eq [System.Windows.Forms.RadioButton] -and $_.Checked })[0].Name
    switch ($prod) {
        "Prism Launcher" {
            if (!(check_path $paths[$prod] $prod)) {break}
            '{"accounts": [{"entitlement": {"canPlayMinecraft": true, "ownsMinecraft": true},"type": "MSA"}], "formatVersion": 3}' | Out-File ($paths[$prod] + "\accounts.json") -Encoding ASCII
            $mb.Invoke($strings[15], $app, "OK", "Information")
        }
        "TL" {
            if (!(check_path $paths[$prod] $prod)) {break}
            $file = Get-Content -Path $paths[$prod] -Raw
            if ($file -match '"premiumAccount": false') {
                $file -replace '"premiumAccount": false', '"premiumAccount": true' | Set-Content -Path $paths[$prod]
                $mb.Invoke($strings[17], $app, "OK", "Information")
            }
            else {
                $mb.Invoke($strings[18], $app, "OK", "Warning") 
            }
        }
        default {
            if ($paths[$prod] -ne $null -and -not (check_path $paths[$prod] $prod)) {break}
            Start-Process powershell -ArgumentList ("`$Product = '$prod'; " + $gstrings[0] + "/" + $activators[$prod] + $gstrings[1]) -Verb RunAs
        }
    }
})

@($ActWin10, $ConvertEvaluationToFull, $ActWinServer, $ActVisio, $ActProject, $ActOffice365, $ActOffice2024, $ActOffice2021, $ActOffice2019, $ActOffice2016, $ActOffice2013, $ActPrismLauncher, $ActTL, $ActMXT, $Act) | ForEach-Object { $ActTab.Controls.Add($_) }

# Downloads tab

$DlWin10 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 6)
    Size = [System.Drawing.Size]::new(83, 23)
    Text = "Windows 10"
}
$toolTip.SetToolTip($DlWin10, $strings[19].Replace("%v%", "10"))

$DlWin11 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 64)
    Size = [System.Drawing.Size]::new(83, 23)
    Text = "Windows 11"
}
$toolTip.SetToolTip($DlWin11, $strings[19].Replace("%v%", "11"))

$DlWin10Ltsc = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 35)
    Size = [System.Drawing.Size]::new(197, 23)
    Text = "Win 10 LTSC 2021 ($($strings[27]))"
}

$DlWin11Ltsc = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 93)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows 11 LTSC 2024"
}

$DlServer2025 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(215, 6)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows Server 2025"
}

$DlServer2022 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(215, 35)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows Server 2022"
}

$DlServer2019 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(215, 64)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows Server 2019"
}

$DlServer2016 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(215, 93)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows Server 2016"
}

$DlServer2012 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(215, 121)
    Size = [System.Drawing.Size]::new(136, 23)
    Text = "Windows Server 2012"
}

$DlWin81 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 122)
    Size = [System.Drawing.Size]::new(83, 23)
    Text = "Windows 8.1"
}

$DlOffice2024Installer = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(437, 7)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "Online"
}
$toolTip.SetToolTip($DlOffice2024Installer, $strings[20] + $strings[22])

$DlOffice2024ISO = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(522, 7)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "ISO"
}
$toolTip.SetToolTip($DlOffice2024ISO, $strings[21])

$DlOffice2021Installer = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(437, 36)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "Online"
}
$toolTip.SetToolTip($DlOffice2021Installer, $strings[20] + $strings[22])

$DlOffice2021ISO = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(522, 36)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "ISO"
}
$toolTip.SetToolTip($DlOffice2021ISO, $strings[21])

$DlOffice2019Installer = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(437, 65)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "Online"
}
$toolTip.SetToolTip($DlOffice2019Installer, $strings[20] + $strings[22])

$DlOffice2019ISO = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(522, 64)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "ISO"
}
$toolTip.SetToolTip($DlOffice2019ISO, $strings[21])

$DlOffice2016Installer = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(437, 93)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "Online"
}
$toolTip.SetToolTip($DlOffice2016Installer, $strings[20] + $strings[22])

$DlOffice2016ISO = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(522, 93)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "ISO"
}
$toolTip.SetToolTip($DlOffice2016ISO, $strings[21])

$DlOffice2013Installer = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(437, 122)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "Online"
}
$toolTip.SetToolTip($DlOffice2013Installer, $strings[23] + $strings[20])

$DlOffice2013ISO = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(522, 121)
    Size = [System.Drawing.Size]::new(68, 23)
    Text = "ISO"
}
$toolTip.SetToolTip($DlOffice2013ISO, $strings[23] + $strings[21])

$l24 = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(362, 11)
    Size = [System.Drawing.Size]::new(70, 15)
    Text = "Office 2024:"
}

$l21 = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(362, 39)
    Size = [System.Drawing.Size]::new(70, 15)
    Text = "Office 2021:"
}

$l19 = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(362, 68)
    Size = [System.Drawing.Size]::new(70, 15)
    Text = "Office 2019:"
}

$l16 = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(362, 97)
    Size = [System.Drawing.Size]::new(70, 15)
    Text = "Office 2016:"
}

$l13 = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(362, 126)
    Size = [System.Drawing.Size]::new(70, 15)
    Text = "Office 2013:"
}

$rufus = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 151)
    Size = [System.Drawing.Size]::new(312, 23)
    Text = "Rufus — " + $strings[24]
}

$DlVisio2024 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(400, 151)
    Size = [System.Drawing.Size]::new(90, 23)
    Text = "Visio 2024 ISO"
}
$toolTip.SetToolTip($DlVisio2024, $strings[21])

$DlProject2024 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(500, 151)
    Size = [System.Drawing.Size]::new(100, 23)
    Text = "Project 2024 ISO"
}
$toolTip.SetToolTip($DlProject2024, $strings[21])

@($DlWin10, $DlWin11, $DlWin10Ltsc, $DlWin11Ltsc, $DlServer2025, $DlServer2022, $DlServer2019, $DlServer2016, $DlServer2012, $DlWin81, $DlOffice2024Installer, $DlOffice2024ISO, $DlOffice2021Installer, $DlOffice2021ISO, $DlOffice2019Installer, $DlOffice2019ISO, $DlOffice2016Installer, $DlOffice2016ISO, $DlOffice2013Installer, $DlOffice2013ISO, $l24, $l21, $l19, $l16, $l13, $rufus, $DlVisio2024, $DlProject2024) | ForEach-Object { $DlTab.Controls.Add($_) }

function bypass_office_geoblock {
    $result = $mb.Invoke($hidden, $strings[28], $app, "YesNo", "Information")
    if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
        New-ItemProperty -Path "HKCU:\Software\Microsoft\Office\16.0\Common\ExperimentConfigs\Ecs" -Name "CountryCode" -PropertyType String -Value "std::wstring|US" -Force
        $mb.Invoke($strings[86], $app, "OK", "Information")
    }
}

$DlWin10.Add_Click({
    try {
        $products = Invoke-RestMethodoke-RestMethod "https://raw.githubusercontent.com/ImMALWARE/$app/main/windl.json"
        Start-Process (Invoke-RestMethodoke-RestMethod "https://api.gravesoft.dev/msdl/proxy?product_id=$($products."10"[0])&sku_id=$($products."10"[1 + ($PSUICulture -ne "ru-RU")])").ProductDownloadOptions[0].Uri
    } catch {
        $result = $mb.Invoke($strings[25], $app, "YesNo", "Warning")
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            $DlWin10.PerformClick()
        }
    }
})

$DlWin11.Add_Click({
    try {
        $products = Invoke-RestMethod "https://raw.githubusercontent.com/ImMALWARE/$app/main/windl.json"
        Start-Process (Invoke-RestMethod "https://api.gravesoft.dev/msdl/proxy?product_id=$($products."11"[0])&sku_id=$($products."11"[1 + ($PSUICulture -ne "ru-RU")])").ProductDownloadOptions[0].Uri
    } catch {
        $result = $mb.Invoke($strings[25], $app, "YesNo", "Warning")
        if ($result -eq [System.Windows.Forms.DialogResult]::Yes) {
            $DlWin11.PerformClick()
        }
    }
})

$DlWin10Ltsc.Add_Click({
    Start-Process $strings[67]
})

$DlWin11Ltsc.Add_Click({
    Start-Process $strings[68]
})

$DlServer2025.Add_Click({
    Start-Process $strings[69]
    $mb.Invoke($hidden, $strings[26], $app, "OK", "Information")
})

$DlServer2022.Add_Click({
    Start-Process $strings[70]
})

$DlServer2019.Add_Click({
    Start-Process $strings[71]
})

$DlServer2016.Add_Click({
    Start-Process $strings[72]
})

$DlServer2012.Add_Click({
    Start-Process $strings[73]
})

$DlWin81.Add_Click({
    Start-Process $strings[85]
})

$DlOffice2024Installer.Add_Click({
    Start-Process $strings[74]
    bypass_office_geoblock
})

$DlOffice2024ISO.Add_Click({
    Start-Process $strings[75]
})

$DlOffice2021Installer.Add_Click({
    Start-Process $strings[76]
    bypass_office_geoblock
})

$DlOffice2021ISO.Add_Click({
    Start-Process $strings[77]
})

$DlOffice2019Installer.Add_Click({
    Start-Process $strings[78]
    bypass_office_geoblock
})

$DlOffice2019ISO.Add_Click({
    Start-Process $strings[79]
})

$DlOffice2016Installer.Add_Click({
    Start-Process $strings[80]
    bypass_office_geoblock
})

$DlOffice2016ISO.Add_Click({
    Start-Process $strings[81]
})

$DlOffice2013Installer.Add_Click({
    Start-Process $strings[82]
})

$DlOffice2013ISO.Add_Click({
    Start-Process $strings[83]
})

$rufus.Add_Click({
    New-Item -Path "$env:temp\$app" -ItemType Directory > $null
    $wc.DownloadFile('https://github.com/pbatard/rufus/releases/download/v4.6/rufus-4.6.exe', "$env:temp\$app\rufus.exe")
    Set-Location $env:SystemRoot\System32
    ./cmd.exe /c start "" "$env:temp\$app\rufus.exe"
})

$DlVisio2024.Add_Click({
    Start-Process $strings[90]
})

$DlProject2024.Add_Click({
    Start-Process $strings[91]
})

#########

$winwifipassman = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(6, 6)
    Size = [System.Drawing.Size]::new(251, 23)
    Text = $strings[29]
}
$tooltip.SetToolTip($winwifipassman, $strings[30])

$explorerext = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(263, 6)
    Size = [System.Drawing.Size]::new(274, 23)
    Text = $strings[31]
}

$winget = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 35)
    Size = [System.Drawing.Size]::new(113, 23)
    Text = $strings[32] + "winget"
}

$store = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(127, 35)
    Size = [System.Drawing.Size]::new(160, 23)
    Text = $strings[32] + "Microsoft Store"
}
$tooltip.SetToolTip($store, $strings[33])

$driversbackup = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 64)
    Size = [System.Drawing.Size]::new(208, 23)
    Text = $strings[34]
}
$tooltip.SetToolTip($driversbackup, $strings[35])

$driversrestore = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(222, 64)
    Size = [System.Drawing.Size]::new(165, 23)
    Text = $strings[36]
}
$tooltip.SetToolTip($driversrestore, $strings[35])

$edgeuninstall = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 93)
    Size = [System.Drawing.Size]::new(208, 23)
    Text = $strings[37]
}

$delspyfiles = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(222, 93)
    Size = [System.Drawing.Size]::new(245, 23)
    Text = $strings[38]
}
$tooltip.SetToolTip($delspyfiles, $strings[39])

$spicetify = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 122)
    Size = [System.Drawing.Size]::new(135, 23)
    Text = $strings[40]
}
$tooltip.SetToolTip($spicetify, $strings[41])

$edit_hosts = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(149, 122)
    Size = [System.Drawing.Size]::new(225, 23)
    Text = $strings[42]
}
$tooltip.SetToolTip($edit_hosts, $strings[43])

@($winwifipassman, $winget, $store, $driversbackup, $driversrestore, $edgeuninstall, $spicetify, $edit_hosts) | ForEach-Object { $FunctionsTab.Controls.Add($_) }

$val = Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -ErrorAction SilentlyContinue
if (!$val -or $val.HideFileExt -ne 0) {
    $FunctionsTab.Controls.Add($explorerext)
}

if ((Test-Path "$env:SystemRoot\System32\CompatTelRunner.exe") -or (Test-Path "$env:SystemRoot\System32\wsqmcons.exe")) {
    $FunctionsTab.Controls.Add($delspyfiles)
}

$winwifipassman.Add_Click({
    Start-Process powershell -ArgumentList "irm https://raw.githubusercontent.com/ImMALWARE/WinWiFiPassMan/main/WinWiFiPassMan.ps1 | Invoke-Expression" -Verb RunAs
})

$explorerext.Add_Click({
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0 -Force
    $explorerext.Visible = $false
})

$winget.Add_Click({
    Start-Process powershell -ArgumentList "irm https://raw.githubusercontent.com/ImMALWARE/winget-installer/main/WingetInstaller.ps1 | Invoke-Expression" -Verb RunAs
})

$store.Add_Click({
    Start-Process wsreset -ArgumentList "-i" -Verb RunAs -Wait
    $mb.Invoke($strings[89], $app, "OK", "Information")
})

$driversbackup.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
        Description = $strings[44]
        RootFolder = [System.Environment+SpecialFolder]::MyComputer
    }
    if ($dialog.ShowDialog() -eq 'OK') {
        Start-Process powershell -ArgumentList "`$host.UI.RawUI.WindowTitle = "$app — $($strings[92])"; pnputil /export-driver * '$($dialog.SelectedPath)'; pause" -Verb RunAs
    }
})

$driversrestore.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
        Description = $strings[45]
        RootFolder = [System.Environment+SpecialFolder]::MyComputer
    }
    if ($dialog.ShowDialog() -eq 'OK') {
        Start-Process powershell -ArgumentList "`$host.UI.RawUI.WindowTitle = "$app — $($strings[93])"; pnputil /add-driver '$($dialog.SelectedPath)\*' /subdirs /install; pause" -Verb RunAs
    }
})

$edgeuninstall.Add_Click({
    New-Item -Path "$env:temp\$app" -ItemType Directory > $null
    $wc.DownloadFile('https://raw.githubusercontent.com/AveYo/fox/eab2269a598ad9e8120cf1d598d48384071ff476/Edge_Removal.bat', "$env:temp\$app\Edge_Removal.bat")
    Set-Location $env:SystemRoot\System32
    ./cmd.exe /c start "$env:temp\$app\Edge_Removal.bat"
})

$delspyfiles.Add_Click({
    Start-Process powershell -ArgumentList @"
    `$host.UI.RawUI.WindowTitle = '$app — $($strings[94])'
    cd '$env:SystemRoot\System32'
    .\takeown.exe /f CompatTelRunner.exe /a
    .\takeown.exe /f wsqmcons.exe /a
    .\icacls.exe CompatTelRunner.exe /grant Administrators:F
    .\icacls.exe wsqmcons.exe /grant Administrators:F
    Stop-Process -Name compattelrunner -Force -ErrorAction SilentlyContinue
    Stop-Process -Name wsqmcons -Force -ErrorAction SilentlyContinue
    Remove-Item CompatTelRunner.exe -Force
    Remove-Item wsqmcons.exe -Force
    pause
"@ -Verb RunAs
})

$spicetify.Add_Click({
    Start-Process powershell -ArgumentList "irm https://raw.githubusercontent.com/spicetify/cli/main/install.ps1 | iex; pause"
})

$edit_hosts.Add_Click({
    Start-Process powershell -ArgumentList @"
        `$host.UI.RawUI.WindowTitle = '$app — $($strings[95])'
        `$current_hosts = Get-Content -Path 'C:\Windows\System32\drivers\etc\hosts' -Raw
        `$new_hosts = irm https://pastebin.com/raw/5zvfV9Lp
        `$start_marker = '### t.me/immalware: hosts file'
        `$end_marker = '### t.me/immalware: end hosts file'

        `$pattern = '(?s)' + [regex]::Escape(`$start_marker) + '.*?' + [regex]::Escape(`$end_marker)

        if (`$current_hosts -match `$pattern) {
            `$updated_hosts = [regex]::Replace(`$current_hosts, `$pattern, `$new_hosts)
        } else {
            `$updated_hosts = `$current_hosts + [Environment]::NewLine + `$new_hosts
        }

        echo `$updated_hosts
        `$updated_hosts | Out-File -Encoding utf8 -FilePath 'C:\Windows\System32\drivers\etc\hosts' -Force
        pause
"@ -Verb RunAs
})

#######

$images = @{
    oimg   = @{url = 'https://i.imgur.com/8L2KS9a.png'; y = 8}
    winimg = @{url = 'https://i.imgur.com/sYPcWTh.png'; y = 71}
}

$images.Keys | ForEach-Object {
    $name = $_
    Set-Variable -Name $name -Value (New-Object System.Windows.Forms.PictureBox -Property @{
        Location = [System.Drawing.Point]::new(8, $images[$name].y)
        Size = [System.Drawing.Size]::new(34, 39)
        Image = [System.Drawing.Image]::FromStream(
            ([System.Net.WebRequest]::Create($images[$name].url)).GetResponse().GetResponseStream()
        )
    })
}

$clear_office16 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(48, 8)
    Size = [System.Drawing.Size]::new(170, 23)
    Text = $strings[46]
}
$tooltip.SetToolTip($clear_office16, $strings[47])

$office_uninstall = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(221, 8)
    Size = [System.Drawing.Size]::new(176, 23)
    Text = $strings[48]
}

$office16_folder = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(403, 8)
    Size = [System.Drawing.Size]::new(160, 23)
    Text = $strings[52]
}

$clear_winkms = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(48, 71)
    Size = [System.Drawing.Size]::new(192, 23)
    Text = $strings[49]
}

$sfc_scannow = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(247, 71)
    Size = [System.Drawing.Size]::new(260, 23)
    Text = $strings[50]
}
$tooltip.SetToolTip($sfc_scannow, "sfc /scannow, DISM /Online /Cleanup-Image /RestoreHealth, chkdsk /b /x")

$otherproblem = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 165)
    Size = [System.Drawing.Size]::new(154, 23)
    Text = $strings[54]
}
$tooltip.SetToolTip($otherproblem, $strings[55])

@($winimg, $oimg, $clear_office16, $office_uninstall, $office16_folder, $clear_winkms, $sfc_scannow, $telegram_fix, $otherproblem) | ForEach-Object { $ProblemsTab.Controls.Add($_) }

$clear_office16.Add_Click({
    if (test-path "$env:ProgramFiles\Microsoft Office\Office16\ospp.vbs"){ 
        $path = "$env:ProgramFiles\Microsoft Office\Office16\"
    }
    elseIf (test-path "${env:ProgramFiles(x86)}\Microsoft Office\Office16\ospp.vbs") {
        $path = "${env:ProgramFiles(x86)}\Microsoft Office\Office16\"
    }
    else {
        $mb.Invoke($strings[56], $app, "OK", "Error")
        exit
    }
    Start-Process powershell -ArgumentList @"
    `$host.ui.RawUI.WindowTitle = '$app — $($strings[57])'
    cd '$path'
    while(`$true){
        `$license = (cscript ospp.vbs /dstatus) | Out-String
        `$match = `$license | Select-String -Pattern 'Last 5 characters of installed product key: (\w{5})'
        if (`$match) {
            `$productKey = `$match.Matches.Groups[1].Value
            cscript ospp.vbs /unpkey:`$productKey
        } else {
            exit
        }
    }
"@ -Verb RunAs -Wait
    $mb.Invoke("OK", $app, "OK", "Information")
})

$office_uninstall.Add_Click({
    Start-Process "ms-contact-support://smc-to-emerald/SARA-UninstallOffice"
    $mb.Invoke($hidden, $strings[84], $app, "OK", "Information")
})

$office16_folder.Add_Click({
    if (Test-Path "$env:ProgramFiles\Microsoft Office") {
        if (!(Test-Path "$env:ProgramFiles\Microsoft Office\Office16")) {
            New-Item -Path "$env:temp\$app" -ItemType Directory > $null
            $wc.DownloadFile('https://archive.org/download/office16_202502/Office16.zip', "$env:temp\$app\Office16.zip")
            Start-Process powershell -ArgumentList "`$host.UI.RawUI.WindowTitle = '$app — $($strings[96])'; New-Item -Path '$env:ProgramFiles\Microsoft Office\Office16' -ItemType Directory; Set-Location '$env:temp\$app'; Expand-Archive .\Office16.zip -DestinationPath '$env:ProgramFiles\Microsoft Office\Office16'" -Verb RunAs -Wait
            $mb.Invoke("OK", $app, "OK", "Information")
        } else {
            $mb.Invoke($strings[87], $app, "OK", "Information")
        }
    } else {
        $mb.Invoke($strings[16].Replace("%p%", "Office"), $app, "OK", "Error")
    }
})

$clear_winkms.Add_Click({
    Start-Process powershell -ArgumentList "`$host.UI.RawUI.WindowTitle = '$app — $($strings[58])'; Set-Location $env:SystemRoot\System32; .\slmgr /upk; .\slmgr /cpky" -Verb RunAs
})

$sfc_scannow.Add_Click({
    Start-Process powershell -ArgumentList "`$host.UI.RawUI.WindowTitle = '$app — $($strings[53])'; Set-Location $env:SystemRoot\System32; .\sfc /scannow; .\Dism /Online /Cleanup-Image /RestoreHealth; Write-Host '$($strings[88])' .\chkdsk ${(Get-WmiObject Win32_OperatingSystem).SystemDrive} /b /x; .\shutdown /r /t 60 /c '$($strings[51])'; pause" -Verb RunAs
})

$otherproblem.Add_Click({
    $tabs.SelectedTab = $InfoTab
})

######

$malwtool = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(8, 5)
    Size = [System.Drawing.Size]::new(102, 15)
    Text = "$app 2.0"
}

$malwru = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 30)
    Size = [System.Drawing.Size]::new(109, 23)
    Text = $strings[60]
}

$lolzteam = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(123, 30)
    Size = [System.Drawing.Size]::new(109, 23)
    Text = $strings[61]
}

$github = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(238, 30)
    Size = [System.Drawing.Size]::new(56, 23)
    Text = "GitHub"
}

$questions = New-Object System.Windows.Forms.Label -Property @{
    AutoSize = $true
    Location = [System.Drawing.Point]::new(8, 91)
    Size = [System.Drawing.Size]::new(86, 15)
    Text = $strings[62] + $strings[55]
}

$telegram = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(8, 115)
    Size = [System.Drawing.Size]::new(124, 23)
    Text = $strings[63]
}

$lolzteam2 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(138, 115)
    Size = [System.Drawing.Size]::new(156, 23)
    Text = $strings[64]
}

$github2 = New-Object System.Windows.Forms.Button -Property @{
    Location = [System.Drawing.Point]::new(300, 115)
    Size = [System.Drawing.Size]::new(156, 23)
    Text = $strings[65]
}

@($malwtool, $malwru, $lolzteam, $github, $questions, $telegram, $lolzteam2, $github2) | ForEach-Object { $InfoTab.Controls.Add($_) }

$malwru.Add_Click({
    Start-Process "https://malw.ru/pages/office"
})

$lolzteam.Add_Click({
    Start-Process "https://lolz.live/threads/4997821"
})

$github.Add_Click({
    Start-Process "https://github.com/ImMALWARE/$app"
})

$telegram.Add_Click({
    Start-Process "https://t.me/immalware_chat"
})

$lolzteam2.Add_Click({
    $lolzteam.PerformClick()
})

$github2.Add_Click({
    Start-Process "https://github.com/ImMALWARE/$app/issues/new"
})

$form.Controls.Add($tabs)
$form.ShowDialog()