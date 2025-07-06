<#
.SYNOPSIS
Detect if a Zoom is installed by a user and not the Intune deployment group.

.DESCRIPTION
Allows detection of user-context installations of Zoom to enforce compliance/auto-update policies pushed via Intune app.

.NOTES
Author: James Mearns | https://github.com/contrxl
Created: 03-02-2024
Updated: 16-02-2024
#>

try {
    $Test = Get-ChildItem -Path "C:\Users\" -Filter "Zoom.exe" -Recurse -Force -ErrorAction SilentlyContinue
    if ($null -eq $Test) {
        Write-Output "Compliant!"
        Exit 0
    } else {
        Write-Warning "Not Compliant!"
        Exit 1
    }
} catch {
    Write-Warning "Not Compliant!"
    Exit 1
}