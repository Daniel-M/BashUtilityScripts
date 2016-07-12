#!/bin/sh
## Runtime variable section
packages="installed_packages.txt"
bkfile="restore_installed_packages.sh"
other_arch_cmd="$(dpkg --print-foreign-architectures)"
add_arch_cmd="dpkg --add-architecture"
temp_add_arch="architectures.txt"

# Check if the backup file already exists
if [ -f $packages ]; then
	echo "Backing up \"$packages\" file into \"$packages.old\"."
	cp $packages $packages.old
fi
# Get the installed packages
dpkg --get-selections > $packages
echo "Generating apt-get \"$bkfile\" script from \"$packages\"." 
awk '{print $1}' $packages > $packages.1
sed ":a;/$/{N;s/\n/ /;ba}" $packages.1 > $packages.2
# Check if other architectures are present
# So the script adds them automatically
if [[ $other_arch_cmd == "" ]]; then
    echo "Current architecture is $(dpkg --print-architecture)."
    echo "No more architectures found."
else 
    rm -f $temp_add_arch
    echo "Current architecture is $(dpkg --print-architecture)."
    for i in $other_arch_cmd
    do
        echo "  Other architectures found: $i."
        echo "$add_arch_cmd $i" >> $temp_add_arch
    done
    echo "apt-get update" >> $temp_add_arch
    sed -i "s/^/apt-get install -y /g" $packages.2
    cat $temp_add_arch $packages.2 > $bkfile
    rm -f $temp_add_arch
fi
rm -f $packages.1
rm -f $packages.2
echo "Script file \"$bkfile\" created."
