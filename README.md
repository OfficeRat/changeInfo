# Kiosk Setup Script

This script automates the setup of a kiosk system using Chromium on Ubuntu. The kiosk system is configured to display a specific URL in full-screen mode. Additionally, it includes steps to uninstall the telemetrytv snap package, install Chromium browser, create a kiosk script, set correct permissions, create a desktop file for autostart, and add a cronjob for periodic restarting.
Usage

### Clone Repository:

```bash
git clone https://github.com/OfficeRat/changeInfo.git
cd changeInfo
```

### Run the Script:

```bash
chmod +x start.sh
./start.sh
```

Note: The script requires administrative privileges and will prompt you for your password.

### Verify Configuration:

```bash
sudo crontab -l
```
Ensure that the cronjob for periodic restarting has been added successfully.

Adjust Configuration (Optional):
Modify the URL variable in the script to set the desired web page.
Tweak other parameters in the script according to your preferences.

### Details

Installs Chromium browser.
Removes the telemetrytv snap package.
Creates a kiosk script (kiosk.sh) in the user's home directory.
Sets correct permissions for the kiosk script.
Creates a desktop entry for autostart (kiosk.desktop).
Adds a cronjob to restart the Chromium browser every weekday at 7:30 AM.

### Requirements

Ubuntu-based system.
Administrative privileges to install packages and modify system files.

### Notes

Ensure that the script is run with the appropriate permissions.
The script assumes a user directory named infoskjerm. Adjust paths and usernames as needed.

Disclaimer: Use this script at your own risk. It is recommended to review and understand the script before executing it on a production system.