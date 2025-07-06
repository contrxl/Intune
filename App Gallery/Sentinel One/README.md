## Installation

1. Download the _.msi_ installer from your SentinelOne console.
2. Wrap the _.msi_ installer with the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool).
3. Upload the _.intunewin_ file as a Win32 App.
4. Set the **"Installation command"** to:
```msiexec /i "SentinelInstaller_windows_64bit_v23_2_3_358.msi" /qn SITE_TOKEN="[YOUR_SITE_TOKEN_HERE]" WSC=false```
> [!IMPORTANT]
> Make sure to replace "SentinelInstaller_windows_64bit_v23_2_3_358.msi" with the name of the _.msi_ you are currently deploying.
Make sure to replace "[YOUR_SITE_TOKEN_HERE]" with your valid site token or this will **_not_** work!
5. Configure the **"Uninstall command"** if required, or just use placeholder text like _uninstall.cmd_.
6. Configure a detection rule using a custom script, the script used can be _detect-s1.ps1_ from here or another custom script. The example here will check if the S1 service is running every 30 seconds for 300 seconds. If the service is not detected after 300 seconds, the install is considered failed. Using this method allows you to use the S1 console to push updates without causing conflicts with Intune.