<#
.SYNOPSIS
Install CleanZoom.exe and run it to remove any installation of Zoom on a device.

.DESCRIPTION
Allows removal of user-context installations of Zoom to enforce compliance/auto-updates on devices.
Stages CleanZoom.exe & logs to C:\Support\Zoom, if you wish to change this, replace all instances of C:\Support\Zoom and C:\Support to the directory you want to use.

.NOTES
Author: James Mearns | https://github.com/contrxl
Created: 03-02-2024
Updated: 16-02-2024
#>


$CleanZoom = "C:\Support\Zoom\CleanZoom.exe"

$CheckCleanZoomDir = Test-Path -Path "C:\Support\Zoom" -PathType Container 
if ($CheckCleanZoomDir -eq $false) {
    New-Item -Path "C:\Support" -Name "Zoom" -ItemType "Directory" -Force
} else {
    Write-Host "Continuing..."
}

$CheckCleanZoomExe = Test-Path -Path $CleanZoom -PathType "Leaf"

if($CheckCleanZoomExe -eq $false) {
    Invoke-WebRequest -Uri "https://assets.zoom.us/docs/msi-templates/CleanZoom.zip" -OutFile "C:\Support\Zoom\CleanZoom.zip"
    Expand-Archive -Path "C:\Support\Zoom\CleanZoom.zip" -DestinationPath "C:\Support\Zoom" -Force
    Remove-Item -Path "C:\Support\Zoom\CleanZoom.zip" -Force
} else {
    Write-Host "Already exists...continuing..."
}

try {
    Start-Process -FilePath $CleanZoom -ArgumentList "/silent"
} catch {
    Write-Host "Failed to run!"
}

