## Installation

> [!IMPORTANT]
> The below instructions assume you already have winget installed in your environment. If you do not have winget installed in your envrionment, this will **not** work.
1. Download [_winget-install.ps1_](https://github.com/Romanitho/Winget-Install/tree/main)
2. Wrap the _.ps1_ file using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool).
3. Upload the _.intunewin_ file to Intune as a Win32 App.
4. Set the **"Installation command"** to:
```"%systemroot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File winget-install.ps1 -AppIDs Notepad++.Notepad++```
5. Set the **"Uninstall command"** to:
```"%systemroot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File winget-install.ps1 -AppIDs Notepad++.Notepad++ -Uninstall```
6. Configure detection rule using a custom script, registry or file detection. For this, I am using a registry detection rule:
   - **Key path:** Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Notepad++
   - **Value name:** DisplayVersion
   - **Detection Method:** Version comparison
   - **Operator:** Equals
   - **Value:** 8.6.2
   - **Associated with a 32-bit app on 64-bit clients:** No