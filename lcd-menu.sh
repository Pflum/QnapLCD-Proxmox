#!/bin/sh
python3 /usr/local/bin/qnap_lcd/preinit.py
sleep 3
python3 /usr/local/bin/qnap_lcd/lcd-menu.py
python3 /usr/local/bin/qnap_lcd/shutdown.py
sleep 3
