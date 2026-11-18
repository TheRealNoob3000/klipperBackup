#!/bin/sh
# Einmalig mit sudo ausfuehren:  sudo sh ~/printer_data/config/standby/install.sh
set -e
H=/home/juri/printer_data/config/standby
install -m 644 $H/klipper-standby.service /etc/systemd/system/klipper-standby.service
mkdir -p /etc/systemd/system/klipper.service.d
install -m 644 $H/klipper-standby.conf /etc/systemd/system/klipper.service.d/standby.conf
install -m 755 $H/klipper-standby-check /usr/local/bin/klipper-standby-check
systemctl daemon-reload
if ! systemctl is-active --quiet klipper.service; then /usr/local/bin/klipper-standby-check; fi
echo "Standby-Klipper installiert."
