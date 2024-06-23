#!/usr/bin/sh

if [ ${EUID} -ne 0 ]
then
  echo +++++++++++++++++++++++++
  echo ++ MUST BE RUN AS ROOT ++
  echo +++++++++++++++++++++++++
  sleep 3
  exit 1 # this is meant to be run as root
fi

installdir=/usr/local/bin/qnap_lcd

mkdir -p $installdir
cd $installdir
if [ $(pwd) == $installdir ]
then
    rm -rf $installdir/*
    git clone https://github.com/Pflum/QnapLCD-Proxmox .
    curl -L https://github.com/pyserial/pyserial/tarball/master | tar xzf - --strip-components=1 --wildcards --no-anchored */serial
    cp lcd-menu.service /etc/systemd/system/
    chmod +x $installdir/lcd-menu.sh
    systemctl daemon-reload
    systemctl enable --now lcd-menu.service
fi
