apt autoremove --purge -y
apt autoclean
apt update
#apt dist-upgrade -y --download-only
export DISPLAY=:0.0 && sudo -u damejia /usr/bin/notify-send -i "/usr/share/icons/Tango/32x32/emblems/emblem-important.png" "Notice:" "Package database updated."
