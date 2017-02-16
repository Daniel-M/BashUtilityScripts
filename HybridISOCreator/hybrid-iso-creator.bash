#!/bin/bash
echo "#######################"
echo "## Hybrid ISO to USB ##"
echo "#######################"
echo "Call me as,"
echo " $ bash $0 iso_file device[/dev/sdX]"
iso_file=$1
device=$2
if [[ $iso_file != "" ]] && [[ $device != "" ]]; then
    if [ -r $iso_file ] && [ -w $device ]; then
        size_of_iso=$(du -b  $1 | awk '{print $1}')
        echo "Parameters:"
        echo " + Iso file: $iso_file of $size_of_iso bytes"
        echo " + Device: $device"
        echo "Shall we proceed? (y/n):"
        read choice
        if [[ $choice == "y" ]]  || [[ $choice == "Y" ]]; then
            echo "Proceeding to create the iso, please wait..."
            echo " + Umounting the device"
            umount $device*
            echo " + Copying data"
            dd if=$iso_file bs=4M | pv --size $size_of_iso | dd of=$device bs=4M
            echo " + Flushing buffers"
            sync
            echo "The USB at $device is ready to be used :D"
        else
            echo "Aborting..."
        fi
    else
        echo "Please check that the iso file or the device exist."
        echo ""
    fi
fi
