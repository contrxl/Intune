## Installation

1. For the ELO PDF Printer, you should have two folders; **JavaClient** and **PdfPrinter**. 
2. Wrap the entire **PdfPrinter** folder using the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). 
3. Upload the _.intunewin_ file to Intune as a Win32 App.
4. Set the **"Installation command"** to:
```msiexec /i "ELO PDF Printer (GS).msi" /quiet```
5. Set the **Uninstallation command** to:
```msiexec /x "[MSI_KEY]" /quiet```
> [!NOTE]
> [MSI_KEY] should automatically populate with the correct MSI key for the version you are installing.
6. Configure the detection rule using MSI. The path/code should fill automatically with the correct MSI key for the version you are installing.