#!/bin/bash

# Install chromium and other packages
sudo apt install chromium-browser

# Uninstall the telemetrytv snap package
sudo snap remove telemetrytv

# Set the URL to open in the kiosk window. for example cloudcast
URL="https://v.getcloudcast.com"

# Create the kiosk script
echo '#!/bin/bash
while true; do
    chromium-browser --noerrdialogs --disable-infobars --kiosk '"$URL"'
done' | sudo tee /home/infoskjerm/kiosk.sh >/dev/null

# Set the correct permissions for the kiosk script
sudo chmod +x /home/infoskjerm/kiosk.sh

# Create the kiosk desktop file
echo '[Desktop Entry]
Type=Application
Name=Kiosk
Exec=/home/infoskjerm/kiosk.sh
X-GNOME-Autostart-enabled=true' | sudo tee /etc/xdg/autostart/kiosk.desktop >/dev/null

# Add the cronjob
cronjob="0 6,10,12 * * 1-5 killall chrome >/dev/null 2>&1"
(crontab -l 2>/dev/null; echo "$cronjob") | sudo crontab -

# Display the modified crontab file
sudo crontab -l
