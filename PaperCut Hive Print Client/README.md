## Installation

1. Download the _.intunewin_ package from PaperCut. To do this; sign into your PaperCut Hive console as administrator, select "Add-ons" from the blade on the left. Under "User Management" add the "Desktop App Deployment with Microsoft Intune" add-on. Once this is added, click "Manage" and then choose "Follow these instructions" in the blade that opens up. At the top of this new page, you will find a download button for the _.intunewin_ package file.
2. Upload the _.intunewin_ file as a Win32 App.
3. Set the **"Installation command"** to:
```papercut-hive.exe /VERYSILENT /region=[YOUR_REGION_ID] /systemkey=[YOUR_SYSTEM_KEY_HERE]```
> [!IMPORTANT]
> Make sure to replace "[YOUR_REGION_ID]" with your correct region identifier.
Make sure to replace "[YOUR_SYSTEM_KEY_HERE]" with your correct system key. These can both be found on the PaperCut Hive instructions web page.
If you do not change these to the correct region identifier & system key, this will **not** work!
4. Set the **"Uninstall command"** to:
```"C:\Program Files\PaperCut Hive\unins000.exe" /VERYSILENT```
5. Configure the detection rule manually as type **File** with the following settings:
   - **Path:** C:\ProgramFiles\PaperCut Hive
   - **File or folder:** pc-edgenode-service.exe
   - **Detection method:** File or folder exists
   - **Associated with a 32-bit app on 64-bit clients:** No