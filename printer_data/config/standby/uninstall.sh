#!/bin/sh
# Rueckweg:  sudo sh ~/printer_data/config/standby/uninstall.sh
systemctl stop klipper-standby.service 2>/dev/null
rm -f /etc/systemd/system/klipper-standby.service /etc/systemd/system/klipper.service.d/standby.conf /usr/local/bin/klipper-standby-check
rmdir /etc/systemd/system/klipper.service.d 2>/dev/null
systemctl daemon-reload
echo "Standby-Klipper entfernt. Verhalten wie vorher."
