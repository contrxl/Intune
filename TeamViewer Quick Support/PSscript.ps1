$File = "TeamViewerQS.exe"
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$Source = “$PSScriptRoot\$File"
$Destination = “C:\Users\Public\Desktop\”
Copy-Item -Path $Source -Destination $Destination –Recurse -Force
