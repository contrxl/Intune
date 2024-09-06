$firefoxPath = "C:\Program Files\Mozilla Firefox\firefox.exe"
$correctVersion = "115.14.0"

if (Test-Path $firefoxPath) {
    try {
        Write-Host " Installed."
        $currentVersion = (Get-Item -Path $firefoxPath).VersionInfo.Fileversion -replace ",","."
        Write-Host $currentVersion
        if ($currentVersion -ne $correctVersion) {
            Write-Host " Wrong version!"
            Exit 1
        } else {
            Write-Host " Correct version."
            Exit 0
        }
    } catch {
    Write-Host $("[" + (Get-Date) + "]" + $_.Exception.Message)
    }
} else {
    Write-Host " No install detected."
    Exit 1
}