#!/usr/bin/env bash
#
# Date: 9 April 2016
# Autor: Daniel-M. www.github.com/Daniel-M/BashUtilityScripts
#  
# Description: This script automatically translates the text stored at primary clipboard (selected text with the mouse pointer)
#			   sending a notificacion showing the translation. The limit of characters of the text is set to 500
# 			   This script can be placed in /usr/local/bin and associate a keybinding in order to use it faster.
#
# Prerequisites: You need to have installed: xclip and libnotify-bin (or equivalent providing notify-send binary)





size_limit=500



matchs() {
	string="$1"
	substring="$2"
	if test "${string#*$substring}" != "$string"; then
		#echo "Yes"
		return 0    # $substring is in $string
	else
		#echo "No"
	return 1    # $substring is not in $string
	fi
}


original_text="$(xclip -selection primary -o)"

if [[ -n "$original_text" ]]; then
	if test "${original_text#*'.com'}" != "$original_text"; then
		#echo "$(xclip -sel primary -o | sed 's/\.com/\.com\.sci-hub\.io/')"
		firefox $(xclip -sel primary -o | sed 's/\.com/\.com\.sci-hub\.io/')
	elif test "${original_text#*'.org'}" != "$original_text"; then
		#echo "$(xclip -sel primary -o | sed 's/\.org/\.org\.sci-hub\.io/')"
		firefox $(xclip -sel primary -o | sed 's/\.org/\.org\.sci-hub\.io/')
	fi
fi
