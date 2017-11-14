# BashUtilityScripts
A set of bash scripts if find useful. I take ideas over the internet and then adapt them to my needs.

### Hybrid ISO Creator 

The process of creating hybrid ISOs' can be boring. Came up with this script that automates the process and 
shows a progress bar. It should work with any Debian-based hybrid ISO (like Ubuntu and such).

### How to use it

As super user (root. This given that we need permissions to write the devices at `/dev`) call the script as,   

``` shell
$ bash hybrid-iso-creator.bash iso_file device[/dev/sdX]
```
It will guide you to the rest of the process.

### Prerequisites

You **must** have installed `pv` and `dd`

### ISO tested

Have tried successfully the script with the following ISOs',   

* ubuntu-16.04  
* xubuntu-16.04  
* debian-amd64-testing  
* debian-amd64-netinstall  


