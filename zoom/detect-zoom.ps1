$ZOOMBIN = "C:\Program Files\Zoom\bin\Zoom.exe"
$CURRENTVERSION = "6.1.10.45028"

if (Test-Path $ZOOMBIN) {
    $ZOOMVERSION = (Get-Item -Path $ZOOMBIN).VersionInfo.Fileversion -replace ",", "."
         if ($ZOOMVERSION -ge $CURRENTVERSION) {
            Write-Host "$ZOOMVERSION installed!"
            Exit 0
         } else {
            Write-Host "Version $ZOOMVERSION needs updated."
            Exit 0
         }
} else {
    Write-Host "Not detected!"
    Exit 1
}