## Installation

1. Download the _.exe_ installer from [here](https://get.adobe.com/uk/reader/enterprise/).
2. Open the _.exe_ with 7zip (or another archive tool) and extract its contents to a folder. It should appear like so:
![The contents of the extracted Adobe Reader .exe file.](/.assets/acro-setup.png)
4. If you are missing a _.msp_ update file like **"AcroRdrDCUpd2300820533.msp"** or require a different version, you can download it from [here](https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html).
5. Create a new _.cmd_ file inside the folder where you extracted the _.exe_ called **install.cmd** or similar, in this file, paste the below line:
```msiexec /i "%~dp0AcroRead.msi" /qn ALLUSERS=1 /Update "%~dp0AcroRdrDCUpd2300820533.msp" /norestart```
6. Create a new _.cmd_ file inside the folder where you extracted the _.exe_ called **uninstall.cmd** or similar, in this file, paste the below line:
```msiexec /x "%~dp0AcroRead.msi" /q```
7. Package the folder with the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
> [!IMPORTANT]
> When packaging the app with the Content Prep Tool, make sure you use **setup.exe** as the setup folder, do **_not_** use the **install.cmd** file.
7. Upload the _.intunewin_ file to Intune as a Win32 App.
8. Set the **"Installation command"** to _install.cmd_ or whatever you named your installation file. 
9. Set the **"Uninstall command"** to _uninstall.cmd_ or whatever you named your uninstallation file.
10. Configure detection rule using a custom script, registry or file detection. The _"detect-acro.ps1"_ script here checks for a registry value being present. This can be done in Intune without a script, I just prefer the script.
