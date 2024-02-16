## Installation

1. Download the _.exe_ installer from [here](https://www.citrix.com/downloads/workspace-app/legacy-workspace-app-for-windows-ltsr/workspace-app-for-windows-1912ltsr1.html).
2. Wrap the _.exe_ using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
3. Upload the _.intunewin_ file to Intune as a Win32 App.
4. Set the **"Installation command"** to:
```CitrixWorkspaceApp.exe /silent /noreboot /AutoUpdateCheck=disabled```
> [!NOTE]
> If you are **_not_** deploying the LTSR version, or wish to have Citrix update as normal, do not set "/AutoUpdateCheck=disabled" from the above.
5. Set the **Uninstallation command** to:
```CitrixWorkspaceApp.exe /uninstall /silent```
6. Configure the detection rule using a custom script, registry or file detection. For this, I used a manual registry detection rule:
   - **Key path:** HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\CitrixOnlinePluginPackWeb
   - **Value name:** DisplayName
   - **Detection method:** String comparison
   - **Operator:** Equals
   - **Value:** Citrix Workspace 1912
   - **Associated with a 32-bit app on 64-bit clients:** No
> [!NOTE]
> Again, if you are not deploying the LTSR version, change the registry detection **Value** accordingly!