# App Deployment Using Win32 Content Prep Tool

## Overview

The Intune Management Extension (IME) is used to deploy Win32 applications to Intune. The IME allows applications or PowerShell scripts to be installed and run on targeted devices. A Win32 application will typically be a file with a _.exe_ or _.msi_ but Intune also allows the execution of _.ps1_, _.cmd_, and _.bat_ files for app or script installations.

## Prerequisities

Before beginning an app deployment, download the [Win32 Content Prep Tool](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool). This tool facilitates the packaging of script and/or application files into a _.intunewin_ file which Intune can use. Once this is installed, you should create three folders:

1. C:\IntuneWinAppUtil : store the Content Prep Tool _.exe_ in here.
2. C:\IntuneSource : store your application packages in here (e.g. any installer files and installation scripts).
3. C:\IntuneApps : this will be the location the Content Prep Tool saves the resulting _.intunewin_ files to.

>[!NOTE]
> These folders can be created wherever you like, they don't have to be these exact paths. As long as you know where they are being stored, any location is generally fine. I would advise keeping them grouped in the same location for ease of access.

## Packaging your First App

Navigate to the location you saved your Content Prep Tool and launch the `IntuneWinAppUtil.exe` file. This will open a command prompt window which will first prompt you to specify the source folder for your app. In this example, we have created another folder inside `C:\IntuneSource` called `TestApp` so our source folder will be `C:\IntuneSource\TestApp`.

Next, you will be asked to provide the path to the setup file. For this example, the path will be `C:\IntuneSource\TestApp\TestApp.exe`. Finally, you will be prompted to specify an output folder. We created this earlier and so it will be `C:\IntuneApps`.

When asked if you wish to specify a catalog folder input **"N"**. 

![Example of completed IntuneWinAppUtil.exe prompt](/.assets/IntuneAppUtil.png)

## Deploying your First App

To deploy the app, head to the [Microsoft Intune Admin Center](https://intune.microsoft.com) and login with your administrator credentials. From here, select the **"Apps"** blade and then **"All Apps"** and select **"Add"**. For our app type we will select **"Windows App (Win32)".** 

![Example of the sequence of clicks to open the app type blade](/.assets/AppBlade.png)

On the following screen, choose your .intunewin file created previously and then select "OK". The form presented here only has three mandatory fields: **"Name"**, **"Description"** and **"Publisher"**. You should always be as detailed as possible here to avoid any issues in future if you have to come back to the application.

![The "App Information" form for app deployment on Intune](/.assets/AppBlade.png)

The next step is the **"Program"** tab. Here we will specify an **"Install Command"** and an **"Uninstall Command"** as well as any installation or restart behaviours we wish to trigger. For our app installation parameters we will use `TestApp.exe /install /qn` and for uninstallation we will use `TestApp.exe /uninstall /qn`. Unless the app requires otherwise you should generally leave this on **"System"**. Optionally, we can also set the **"Installation time required (mins)"** and **"Allow available uninstall"**. These options allow you specify how long the system will wait for an installation to finish and whether users are able to uninstall the app on their own from the Company Portal respectively. For **"Device Restart Behaviour"** you can choose between four available options:

- Determine behaviour based on return codes : restart based on the post-installation return code.
- No specific action : do not restart or take any action post-installation.
- App install may force a device restart : device may restart depending on app requirements.
- Intune will force a restart : device always restarts post-installation.

The choice here is yours, typically I would set this to either **"No specific action"** for a fully silent install or **"App install may force a device restart"** if device behaviour does not matter.

> [!WARNING]
> Intune app deployments require a "Silent Install" switch, like "/qn", "/q" or "/s". If your app does not support silent installation it cannot be deployed. If you are not sure what your software's silent install switch is you can run "<\installer_name.exe> /?" in PowerShell. If this does not work then [ITNinja](https://www.itninja.com/software-library/software) can be a good resource to identify the correct switch.

![The "Program" tab for app deployment on Intune](/.assets/ProgramMenu.png)

Next, the **"Requirements"** tab allows you to set minimum system requirements. The only mandatory fields here are **"Operating System Architecture"** and **"Minimum Operating System".** Once these are set you can move on. The **"Requirements"** tab can be used for some advanced deployments but that will not be covered here.

![The "Requirements" tab for an app deployment on Intune](/.assets/AppRequirements.png)

The next tab, **"Detection Rules"**, will tell Intune where to look post-installation to confirm the app is actually installed. This can be done using manually configured rules or custom scripts. Manual configuration is the easier option and lets you create a basic rule that looks for a file, MSI or registry key that you specify (for some apps this may even auto-fill). A custom detection script lets you upload a .ps1 file of choice which will run after installation to identify the application based on your script. For this app, we will be using a manual detection rule with the parameters in the below screenshot.

![The "Detection Rules" tab for an app deployment on Intune](/.assets/DetectionRules.png)

The next options will be covered briefly; **"Dependencies"** and **"Supersedence"**.

**"Dependencies"** allow you set a prerequisite or parent application. Intune will check to see if this application is installed first before attempting to install the new app. For example, if we only wanted TestApp to deploy to users who have TestApp2 installed then we could set TestApp2 as a dependency, meaning that only users with a detected TestApp2 install would receive TestApp1.

**"Supersedence"** allows you to specify an application for your app to overwrite or uninstall. For example, if we wanted TestApp to supersede TestApp2 we could set it as a supersedence and have it remove the old app, Intune would attempt to uninstall TestApp2 and then install TestApp in its place.

For this example we will not set any **"Dependencies"** or **"Supersedence"** and move on to **"Scope Tags"**. These can help apply RBAC (Role-based Access Control), but again, we won't be using any here. 

Finally, we set the **"Assignments"**. Here we have three options; **"Required"**, **"Available for Enrolled Devices"** and **"Uninstall"**. Assigning groups to **"Required"** makes it a mandatory install for that group as long as all previous criteria are met. Assigning groups to **"Available for Enrolled Devices"** makes the app available via the Company Portal for that group. Assigning groups to **"Uninstall"** will attempt to uninstall the app for those users. Now select **"Review + create"**, once you have confirmed your settings are correct, proceed and wait for the app to upload.

![Assignments page for our test app](/.assets/AppAssignments.png)