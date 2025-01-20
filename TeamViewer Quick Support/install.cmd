SET WorkingDir=%cd%
SET PSPath='%WorkingDir%\PSscript.ps1'
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& %PSPath%"
