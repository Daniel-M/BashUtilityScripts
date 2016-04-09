# BashUtilityScripts
A set of bash scripts if find useful. I take ideas over the internet and then adapt them to my needs.

### Autimatic laptop hibernation with simple battery monitor 

Add a simple cron task to keep an eye on the battery of your laptop and hibernate when some threshold is reached.
Useful when no power management is available.

### How set it up

Give execution permissions, then, as root, create a crontab entry that executes the script each 15 mins or so.
The threshold is declared inside the script, you **must** set the user which will see the notification warning about
the hibernation.

* `time_out` sets the amount of seconds before hibernation   
* `user_prompt` sets the user name of the user that will see the notification  
