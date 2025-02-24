[README in english](https://github.com/ImMALWARE/MalwTool/blob/main/README_EN.md)
# MalwTool — инструмент для активации, скачивания, настройки Windows и Office
![Скриншот](https://github.com/ImMALWARE/MalwTool/raw/main/files/screenshot.png?raw=true)

## Запуск
Для запуска необходимо выполнить команду. Проще всего открыть поиск Windows и выполнить её там. Но ещё можно выполнить в Win + R, в cmd, в PowerShell, в мастере создания ярлыка
```pwsh
powershell -command "iwr -useb https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/MalwTool.ps1 | iex"
```
Второй, сокращенный вариант команды (просто редирект на тот же GitHub с моего сайта)
```pwsh
powershell -command "iwr -useb https://malw.ru/dl/malwtool | iex"
```

# Возможности
## Активация:
* Windows 10/11 всех редакций, в том числе LTSC (LTSC будет конвертирована в LTSC IoT, она имеет более долгий срок поддержки) по HWID (активация будет сохраняться даже после переустановки системы)
* Windows 10 LTSC Evaluation -> LTSC (LTSC Evaluation — пробная версия LTSC, доступная для скачивания на сайте Microsoft. MalwTool может конвертировать её в обычную LTSC, затем её можно будет активировать, пункт выше)
* Windows Server 2022, Windows Server Standard, Windows Server Datacenter, 2019, 2016, 2012, 2012 R2, 1803, 1709 через KMS
* Office 2013, 2016, 2019, 2021, 2024, 365 через sppc.dll
* Visio 2016/2019/2021 -> 2021 (будут конвертированы в 2021) через KMS
* Project 2016/2019/2021 -> 2021 (будут конвертированы в 2021) через KMS
* Prism Launcher (разблокировка оффлайн аккаунта)
* TL (разблокировка возможности отключить добавление рекламных серверов)
* MobaXterm

## Скачивание:
* Windows 10 последней версии (с официального сайта Microsoft, без средств обхода блокировок)
* Windows 10 LTSC 2021 (рекомендуется)
* Windows 11 последней версии (с официального сайта Microsoft, без средств обхода блокировок)
* Windows 11 LTSC 2024
* Windows 8.1
* Windows Server 2025, 2022, 2019, 2016, 2012
* Rufus
* Office 2024, 2021, 2019, 2016, 2013 (онлайн-установщик либо ISO архив. В случае онлайн-установщика, MalwTool поможет обойти ограничения)
* Visio 2024 (ISO)
* Project 2024 (ISO)

## Другие функции:
* Узнать пароли от сохранённых Wi-Fi сетей
* Установить winget
* Установить Microsoft Store
* Резервное копирование и восстановление драйверов (рекомендуется при переустановке)
* Полное удаление Microsoft Edge
* Удаление CompatTelRunner.exe и wsqmcons.exe (системные шпионские файлы, нагружают процессор во вред)
* Установка Spicetify
* Изменение файла hosts для обхода блокировок пользователям из России

## Решение проблем:
* Очистка лицензий Office16
* Инструмент удаления Office (необходимо установленное приложение "Техническая поддержка" (Get Help) в Windows)
* Отсутствие папки Office16
* Сброс KMS-активации Windows
* Проверка системных файлов на целостность (sfc /scannow, DISM /Online /Cleanup-Image /RestoreHealth, chkdsk C: /b /x)

# MalwTool Legacy — для Windows 8/8.1
![Скриншот](https://github.com/ImMALWARE/MalwTool/raw/main/files/screenshot_legacy.png?raw=true)

## Запуск
Для запуска необходимо выполнить команду. Проще всего открыть поиск Windows и выполнить её там. Но ещё можно выполнить в Win + R, в cmd, в PowerShell, в мастере создания ярлыка
```pwsh
powershell -command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; irm https://raw.githubusercontent.com/ImMALWARE/MalwTool/main/MalwToolLegacy.ps1 | iex"
```

## Возможности по активации:
* Windows 8/8.1
* Office 2016
* Office 2013
* Visio 2016
* Project 2016

# А что есть на Windows 7?
Гайды тут: https://github.com/ImMALWARE/MalwTool/wiki/%D0%94%D0%BB%D1%8F-Windows-7-(%D0%BD%D0%B0-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%BE%D0%BC)

# Есть вопросы? Предложения? Сообщения об ошибке?
## Можно сообщить сюда:
* [Github Issues](https://github.com/ImMALWARE/MalwTool/issues/new)
* [Telegram чат](https://t.me/immalware_chat)
* [Тема Lolzteam](https://lolz.live/threads/4997821)