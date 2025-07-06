## Detection

1. Download the _detect-user-zoom.ps1_ & the _clean-zoom.ps1_ file.
2. Navigate to Intune and to _"Devices > Scripts and Remediations"_.
3. Create a new Remediation, upload _detect-user-zoom.ps1_ as the **Detection** script.
4. If you only wish to check for installations in user-context, you can now proceed through the rest of the steps, assigning it to groups as required. If you wish to remove user-context installations, follow the next instruction set for remediation.

## Remediation

1. Download the _detect-user-zoom.ps1_ & the _clean-zoom.ps1_ file.
2. Navigate to Intune and to _"Devices > Scripts and Remediations"_.
3. Create a new Remediation, upload _detect-user-zoom.ps1_ as the **Detection** script.
4. Modify the _clean-zoom.ps1_ script if required (logs are saved by default in C:\Support\Zoom).
5. Upload the _clean-zoom.ps1_ script as the **Remediation** script. 
6. Proceed through the rest of the steps, assigning to groups as required.
7. Each time the script runs, it will check the assigned devices for user-context Zoom installs, and remove it. Users with Zoom installed in system-context via Intune will **not** be affected by this script.