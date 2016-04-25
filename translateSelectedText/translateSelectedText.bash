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

# This variable stores the desired target language to make translations to
# es - Spanish
# en - English
# it - Italian
# fr - French 
# tr - Turkish
translated_to=es

# This sets the limit of characters for the input text
size_limit=500

original_text="$(xclip -selection primary -o)"
if [[ -n "$original_text" && "${#original_text}" -le "$size_limit" ]]; then
	original_text="$(xclip -selection primary -o | sed "{s/\n/ /g;s/\r/ /g}")"
	translation_result=$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$(echo "$translated_to")&dt=t&q=$(echo $original_text | sed "{s/[\"'<>]//g}" )")
	translated_text=$(echo $translation_result | sed '{s/\[//g;s/\]//g;s/\,\,\,/\",\"/g}' | awk -F "\",\"" '{print $1}' | sed 's/\"//')
	translated_from=$(echo $translation_result | sed '{s/\[//g;s/\]//g;s/\,\,\,/\",\"/g}' | awk -F "\",\"" '{print $3}' | awk -F "," '{print $3}' | sed 's/\"//g')
	notify-send -u normal -i info "Clip text translator" "<b>Text on clip:</b> <i>$original_text</i>\n\n<b>Translation:</b> <i>$translated_text</i>\n\nTranslated from <b>$translated_from</b> to <b>$translated_to</b>" -t 10000
else
	notify-send -u normal -i info "Clip text translator" "There is no text on the clip or it is greater than $size_limit characters." -t 10000
fi
