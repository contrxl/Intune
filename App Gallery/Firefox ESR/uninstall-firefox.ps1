$uninstallExecutable = "C:\Program Files\Mozilla Firefox\uninstall\helper.exe"
Start-Process -FilePath $uninstallExecutable -ArgumentList "/silent"