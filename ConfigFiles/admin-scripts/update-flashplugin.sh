actual_version=$(update-flashplugin-nonfree --status | head -n 1 | tail -n 1 | awk -F": " '{print $2}')
upstream_version=$(update-flashplugin-nonfree --status | head -n 2 | tail -n 1 | awk -F": " '{print $2}')
if [ "$actual_version" = "$upstream_version" ]; then
#    echo "Doesn't require update"
    export DISPLAY=:0.0 && sudo -u damejia /usr/bin/notify-send -i "/usr/share/icons/Tango/32x32/emblems/emblem-important.png" "Notice:" "flash plugin in the latest version $actual_version."
else
#    echo "Requires update"
    update-flashplugin-nonfree --install
    export DISPLAY=:0.0 && sudo -u damejia /usr/bin/notify-send -i "/usr/share/icons/Tango/32x32/emblems/emblem-important.png" "Notice:" "flash plugin updated to version $upstream_version."
fi
