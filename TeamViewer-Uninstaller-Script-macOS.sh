#!/bin/bash

echo "Starting TeamViewer uninstallation script..."

# Kill TeamViewer processes
echo "Attempting to kill TeamViewer processes..."
if killall TeamViewer 2>/dev/null; then
    echo "Successfully killed TeamViewer process."
else
    echo "TeamViewer process not found or could not be killed."
fi

if killall TeamViewer Host 2>/dev/null; then
    echo "Successfully killed TeamViewer Host process."
else
    echo "TeamViewer Host process not found or could not be killed."
fi

# Remove TeamViewer application support directories
echo "Removing TeamViewer application support directories..."
if rm -rf "/Library/Application Support/TeamViewer"; then
    echo "Removed /Library/Application Support/TeamViewer."
else
    echo "/Library/Application Support/TeamViewer not found or could not be removed."
fi

if rm -rf "/Library/Application Support/TeamViewer Host"; then
    echo "Removed /Library/Application Support/TeamViewer Host."
else
    echo "/Library/Application Support/TeamViewer Host not found or could not be removed."
fi

# Remove TeamViewer preferences and launch files
echo "Removing TeamViewer preferences and launch files..."
if rm -f /Library/Preferences/com.teamviewer.*; then
    echo "Removed /Library/Preferences/com.teamviewer.*."
else
    echo "/Library/Preferences/com.teamviewer.* not found or could not be removed."
fi

if rm -f /Library/LaunchDaemons/com.teamviewer.*; then
    echo "Removed /Library/LaunchDaemons/com.teamviewer.*."
else
    echo "/Library/LaunchDaemons/com.teamviewer.* not found or could not be removed."
fi

if rm -f /Library/LaunchAgents/com.teamviewer.*; then
    echo "Removed /Library/LaunchAgents/com.teamviewer.*."
else
    echo "/Library/LaunchAgents/com.teamviewer.* not found or could not be removed."
fi

# Remove TeamViewer user preferences
echo "Removing TeamViewer user preferences..."
if rm -f ~/Library/Preferences/com.teamviewer.*; then
    echo "Removed ~/Library/Preferences/com.teamviewer.*."
else
    echo "~/Library/Preferences/com.teamviewer.* not found or could not be removed."
fi

# Remove additional potential TeamViewer files
echo "Removing additional TeamViewer files..."
if rm -rf /Applications/TeamViewer.app; then
    echo "Removed /Applications/TeamViewer.app."
else
    echo "/Applications/TeamViewer.app not found or could not be removed."
fi

if rm -rf /Applications/TeamViewerHost.app; then
    echo "Removed /Applications/TeamViewerHost.app."
else
    echo "/Applications/TeamViewerHost.app not found or could not be removed."
fi

if rm -f ~/Library/Logs/TeamViewer*; then
    echo "Removed ~/Library/Logs/TeamViewer*."
else
    echo "~/Library/Logs/TeamViewer* not found or could not be removed."
fi

if rm -rf ~/Library/Application\ Support/TeamViewer; then
    echo "Removed ~/Library/Application Support/TeamViewer."
else
    echo "~/Library/Application Support/TeamViewer not found or could not be removed."
fi

# Optional: Remove TeamViewer from system-wide receipts (for package installations)
echo "Removing TeamViewer package receipts..."
if pkgutil --forget com.teamviewer.teamviewer 2>/dev/null; then
    echo "Forgot package 'com.teamviewer.teamviewer'."
else
    echo "Package 'com.teamviewer.teamviewer' not found or could not be forgotten."
fi

if pkgutil --forget com.teamviewer.teamviewerhost 2>/dev/null; then
    echo "Forgot package 'com.teamviewer.teamviewerhost'."
else
    echo "Package 'com.teamviewer.teamviewerhost' not found or could not be forgotten."
fi

# Exit with a status of 0
echo "TeamViewer uninstallation script completed."
exit 0
