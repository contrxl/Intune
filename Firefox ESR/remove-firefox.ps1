
$workDir = "C:\FirefoxBackup"
if (Test-Path $workDir){
    Continue
} else {
    New-Item -Path "C:\" -Name "FirefoxBackup" -ItemType "directory"
}
$profilesPath = "$Env:APPDATA\Mozilla\Firefox\Profiles"
$firefoxPath = "C:\Program Files\Mozilla Firefox"
function uninstallFirefox {
    if (Test-Path $firefoxPath){ 
        try {
            Write-Host " Firefox installed, removing."
            Start-Process -FilePath "$firefoxPath\uninstall\helper.exe" -ArgumentList "/s"
            Write-Host " Firefox removed, checking profiles." 
        } catch {
            Write-Host $("[" + (Get-Date) + "]" + $_.Exception.Message)
        }
    } else {
    }
    
}
uninstallFirefox
function copyProfiles {
    try {
        if (Test-Path $profilesPath) {
            Write-Host " Detected profiles, backing up."
            Copy-Item -Path $profilesPath -Destination $workDir -Recurse -Force
            Write-Host " Backing up profiles."
        } else {
            Write-Host " No existing profiles found."
        }
    } catch {
        Write-Host $("[" + (Get-Date) + "]" + $_.Exception.Message) 
    }
}
copyProfiles