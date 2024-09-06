## Installation

1. Download the _.msi_ from [Zoom](https://zoom.us/download/admin).
2. Wrap the _.msi_ using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool).
3. Upload the _.intunewin_ file as a Win32 App.
4. Set the **"Installation command"** to:
 ```msiexec /i "ZoomInstallerFull.msi" /quiet /qn /norestart zConfig="AU2_EnableAutoUpdate=1;AU2_InstallAtIdleTime=1;AU2_SetUpdateChannel=1;NoFacebook=1;NoGoogle=1;EnableAppleLogin=0"```
 This will ensure auto-update is enforced & set to the fast channel for all installations. You can find more details on enterprise level insallation [here](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0058493).
 5. Set the **"Uninstall command"** to:
 ```msiexec /x "{499EA83F-642D-40CB-A55E-5D385DEDD376}" /qn```
 6. Configure a custom detection rule using the _detect-zoom.ps1_ script. The "Current Version" variable here can be modifed as necessary.