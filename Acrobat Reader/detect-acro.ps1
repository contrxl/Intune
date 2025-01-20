$Acro = Test-Path -Path "C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader"
$AcroReg = Test-Path -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}"
$AcroProp = Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}" -Name "DisplayVersion"

try {
    if ($AcroProp.DisplayVersion -eq "23.008.20533" -and $Acro -and $AcroReg) {
        Write-Host "Correct!"
        Exit 0
    } else {
        Write-Host "Wrong!"
        Exit 1
    }
} catch {
    Write-Host "Error reading reg!"
    Exit 1
}
