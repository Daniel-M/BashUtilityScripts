# BashUtilityScripts
A set of bash scripts if find useful. I take ideas over the internet and then adapt them to my needs.

### Backup the installed packages list and the architectures added

I use this after a fresh install of Debian, it creates a script that can be used to restore all presently installed
packages.

## How to use.

As `root` run the script with bash. It will generate a script called `restore_installed_packages.sh` that 
deals with adding the installed architectures and all the packages installed. You can manually purge the script
in order to select whose packages shouldn't be installed, but given the unwanted prerequisites this step should
be performed manually before generating the script (since apt-get autoremove can clean the unwanted packages).


