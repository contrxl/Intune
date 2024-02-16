## Installation

1. Download the _.msi_ from [Zoom](https://zoom.us/download#client_4meeting).
> [!NOTE]  
> The _.msi_ download appears under **Download for IT Admin** in the top right of the page, level with **Download Center**. The other installs on this page are for the _.exe_.
![The Zoom download center "Download for IT Admin" menu.](/.assets/download-center.png)
2. Wrap the _.msi_ using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool).
3. Upload the _.intunewin_ file as a Win32 App.
4. Set the **"Installation command"** to:
 ```msiexec /i "ZoomInstallerFull.msi" /qn /norestart ZConfig="AU2_EnableAutoUpdate=true;AU2_SetUpdateChannel=1;InstallAtIdleTime=true"```
 This will ensure auto-update is enforced & set to the fast channel for all installations. You can find more details on enterprise level insallation [here](https://support.zoom.com/hc/en/article?id=zm_kb&sysparm_article=KB0058493).
 5. Set the **"Uninstall command"** to:
 ```msiexec /x "{499EA83F-642D-40CB-A55E-5D385DEDD376}" /qn```
 6. Configure detection rule using a custom script, registry or file detection. For this, I used a _MSI_ detection rule. 