# BashUtilityScripts
A set of bash scripts if find useful. I take ideas over the internet and then adapt them to my needs.

### Automatic selected text translation

When you select some text with the mouse pointer, you can keybind the script to show a notification with the
translated text. There is a size limit on the input that can be changed by changing the value on the variable.

This script requires you have installed `xclip` and `notify-send` on your system.

### How set it up

Give execution permissions and place the executable at some place like `/usr/local/bin`,
keybind the executable as you like (for example ctrl+alt+t) and it should work like charm

* `translate_to` sets the language to translate to.  
* `size_limit` sets the limit of characters to be processed.  
