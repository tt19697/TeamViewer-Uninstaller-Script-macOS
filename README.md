
# TeamViewer Uninstallation Script

This script is designed to fully uninstall TeamViewer and/or TeamViewer Host from macOS. It ensures that all related processes are terminated, and all associated files and directories are removed.

Place this script in to any desired MDM, like Jamf or use the script standalone. When using standalone, ensure you make the .sh file executable (chmod +x location/of/script.sh)

## Usage

1. **Download the Script**: Save the script to your local machine.

2. **Make the Script Executable**: Open a terminal and navigate to the directory where the script is saved. Run the following command to make the script executable:
   ```bash
   chmod +x uninstall_teamviewer.sh
   ```

3. **Run the Script**: Execute the script with sudo to ensure it has the necessary permissions to remove system files:
   ```bash
   sudo ./uninstall_teamviewer.sh
   ```

## Script Details

The script performs the following actions:

1. **Kill TeamViewer Processes**:
   - `killall TeamViewer`
   - `killall TeamViewer Host`

2. **Remove Application Support Directories**:
   - `/Library/Application Support/TeamViewer`
   - `/Library/Application Support/TeamViewer Host`

3. **Remove Preferences and Launch Files**:
   - `/Library/Preferences/com.teamviewer.*`
   - `/Library/LaunchDaemons/com.teamviewer.*`
   - `/Library/LaunchAgents/com.teamviewer.*`

4. **Remove User Preferences**:
   - `~/Library/Preferences/com.teamviewer.*`

5. **Remove Additional TeamViewer Files**:
   - `/Applications/TeamViewer.app`
   - `/Applications/TeamViewerHost.app`
   - `~/Library/Logs/TeamViewer*`
   - `~/Library/Application Support/TeamViewer`

6. **Forget Package Receipts** (Optional):
   - `pkgutil --forget com.teamviewer.teamviewer`
   - `pkgutil --forget com.teamviewer.teamviewerhost`

The script logs each action to the terminal, indicating whether the action was successful or if the file/process was not found.

## Example Output

```bash
Starting TeamViewer uninstallation script...
Attempting to kill TeamViewer processes...
TeamViewer process not found or could not be killed.
TeamViewer Host process not found or could not be killed.
Removing TeamViewer application support directories...
Removed /Library/Application Support/TeamViewer.
Removed /Library/Application Support/TeamViewer Host.
Removing TeamViewer preferences and launch files...
Removed /Library/Preferences/com.teamviewer.*.
Removed /Library/LaunchDaemons/com.teamviewer.*.
Removed /Library/LaunchAgents/com.teamviewer.*.
Removing TeamViewer user preferences...
Removed ~/Library/Preferences/com.teamviewer.*.
Removing additional TeamViewer files...
Removed /Applications/TeamViewer.app.
Removed /Applications/TeamViewerHost.app.
Removed ~/Library/Logs/TeamViewer*.
Removed ~/Library/Application Support/TeamViewer.
Removing TeamViewer package receipts...
Forgot package 'com.teamviewer.teamviewer'.
Forgot package 'com.teamviewer.teamviewerhost'.
TeamViewer uninstallation script completed.
```

## Notes

- Ensure that you have the necessary administrative privileges to run this script, or by leveraging MDM to deploy this script with elevation.
- The script should be run with caution as it will remove files and directories without prompting for confirmation. Always do your own testing before deployment.
