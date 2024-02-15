## Installation

1. Download the .exe installer from [here](https://get.adobe.com/uk/reader/enterprise/).
2. Open the __.exe__ with 7zip (or another archive tool) and extract its contents to a folder. It should appear like so:
![The contents of the extracted Adobe Reader .exe file.](/.assets/acro-setup.png)
3. If you are missing a __.msp__ update file like **"AcroRdrDCUpd2300820533.msp"** or require a different version, you can download it from [here](https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html).
4. Create a new __.cmd__ file inside the folder where you extracted the __.exe__ called **install.cmd** or similar, in this file, paste the below line:
```msiexec /i "%~dp0AcroRead.msi" /qn ALLUSERS=1 /Update "%~dp0AcroRdrDCUpd2300820533.msp" /norestart```
5. Create a new __.cmd__ file inside the folder where you extracted the __.exe__ called **uninstall.cmd** or similar, in this file, paste the below line:
```msiexec /x "%~dp0AcroRead.msi" /q```
6. Package the folder with the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
[!IMPORTANT]
When packaging the app with the Content Prep Tool, make sure you use **setup.exe** as the setup folder, do **__not__** use the **install.cmd** file.
7. Upload the __.intunewin__ file to Intune as a Win32 App.
8. Set the **"Installation command"** to __install.cmd__ or whatever you named your installation file. 
9. Set the **"Uninstall command"** to __uninstall.cmd__ or whatever you named your uninstallation file.
10. Configure detection rule using a custom script, registry or file detection. The __"detect-acro.ps1"__ script here checks for a registry value being present. This can be done in Intune without a script, I just prefer the script.