## Installation

1. Download _install.cmd_, _uninstall.cmd_ and _PSscript.ps1_.
2. Download the TeamViewer QuickSuppot client from [here](https://www.teamviewer.com/en/download/windows/).
3. Store _install.cmd_, _uninstall.cmd_, _PSscript.ps1_ and *TeamViewerQS_x64.exe* in your source/packaging folder.
4. Ensure that the _$File_ variable in _PSscript.ps1_ matches the name of your downloaded QuickSupport _.exe_. If it does not, change the name to match before proceeding.
5. Wrap the folder using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool).
6. Upload the _.intunewin_ file as a Win32 App.
7. Set the **"Installation command"** to:
```install.cmd```
8. Set the **"Uninstall command"** to:
```uninstall.cmd```
9. Configure the detection rule manually as type **File** with the following settings:
   - **Path:** %allusersprofile%\Desktop
   - **File or folder:** TeamViewerQS.exe
   - **Detection method:** File or folder exists
   - **Associated with a 32-bit app on 64-bit clients:** No
> [!NOTE]
> Remember to change the **File or folder** name to the name of your QuickSupport _.exe_. 