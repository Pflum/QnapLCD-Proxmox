#!/usr/bin/sh

if [ ${EUID} -ne 0 ]
then
  echo +++++++++++++++++++++++++
  echo ++ MUST BE RUN AS ROOT ++
  echo +++++++++++++++++++++++++
  sleep 3
	exit 1 # this is meant to be run as root
fi

mkdir -p /usr/local/bin/qnap_lcd
rm -rf /usr/local/bin/qnap_lcd/*
cd /usr/local/bin/qnap_lcd
git clone https://github.com/DigitalFunk/QnapLCD-Proxmox .
curl -L https://github.com/pyserial/pyserial/tarball/master | tar xzf - --strip-components=1 --wildcards --no-anchored */serial
cp lcd-menu.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now lcd-menu.service
