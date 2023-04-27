#!/bin/bash

# Install chromium and other packages
sudo apt install chromium-browser

# Uninstall the telemetrytv snap package
sudo snap remove telemetrytv

# Set the URL to open in the kiosk window
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


sudo reboot
