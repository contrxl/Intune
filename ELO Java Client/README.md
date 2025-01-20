## Installation

1. For the ELO Java Client, you should have two folders; **JavaClient** and **PdfPrinter**. 
2. Wrap the entire **JavaClient** folder using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
3. Upload the _.intunewin_ file to Intune as a Win32 App.
4. Set the **"Installation command"** to:
```msiexec /i "ELO Java Client.msi" /qn NAME1="[YOUR_NAME1]" ARCHIVE1="https:\\[YOUR_ARCHIVE1_LINK]"```
> [!IMPORTANT]
> Make sure to set [YOUR_NAME1] to the correct & relevant archive name.
Make sure to set [YOUR_ARCHIVE1_LINK] to the correct & relevant archive link.
You can add more archives by configuring "NAME2=" and "ARCHIVE2=" etc. You can also add archives directly to registry by uploading a _.reg_ file.
If you do not make these changes at setup or upload a _.reg_ file, the ELO archives will not be visible to users!
5. Set the **Uninstallation command** to:
```msiexec /x "[MSI_KEY]" /qn```
> [!NOTE]
> [MSI_KEY] should automatically populate with the correct MSI key for the version you are installing.
6. Configure the detection rule using MSI. The path/code should fill automatically with the correct MSI key for the version you are installing.
7. If the PDF Printer is also required, see here.