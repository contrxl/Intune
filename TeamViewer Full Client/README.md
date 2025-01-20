## Installation

1. Download the "TeamViewer Full Client"  _.exe_ installer from [here](https://www.teamviewer.com/en/download/windows/).
2. Wrap the _.exe_ using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
3. Upload the _.intunewin_ file to Intune as a Win32 App.
4. Set the **"Installation command"** to:
```TeamViewer_Setup_x64.exe /S```
5. Set the **Uninstallation command** to:
```C:\Program Files\TeamViewer\uninstall.exe \S```
6. Configure the detection rule using a custom script, registry or file detection. For this, I used a manual registry detection rule:
   - **Key path:** HKEY_LOCAL_MACHINE\SOFTWARE\TeamViewer\
   - **Value name:** Version
   - **Detection method:** Value exists
   - **Associated with a 32-bit app on 64-bit clients:** No