#!/bin/bash
#
# This script must be invoked as root user by a cron process each 15 mins.
#
user_prompt=damejia
time_out=60
batteryState=$(acpi | awk '{print $4}' | sed 's/%//g')
if [[ ("$batteryState" -ne "") && ("$batteryState" -le "1000") ]]; then
		export DISPLAY=:0.0 && sudo -u $user_prompt /usr/bin/notify-send -i "/usr/share/icons/Tango/32x32/emblems/emblem-important.png" "<b>Battery state monitor</b>" "Battery level is $batteryState%, system will hibernate in $time_out seconds. Save your work." -t 7000
		sleep $time_$time_outt
		systemctl hibernate
else
	echo "No battery plugged, energy level is $batteryState%"
fi


