#!/bin/bash 
  # A very simple Bash script to download a YouTube video 
  # and extract the music file from it. 
address=$1
quality=320k
channels=2
echo "Gettin playlist from $address"
youtube-dl -f bestaudio $address 
for $i in $(ls -l *.m4a);
do
	echo "Format m4a detected"
	ffmpeg -i "$i" -acodec mp3 -ac $channels -ab $quality "$i.mp3"
	rename 's/.m4a.mp3/.mp3/g' *.mp3
done
for $j in $(ls -l *.webm);
do
	echo "Format webm detected"
	ffmpeg -i "$j" -acodec mp3 -ac $channels -ab $quality "$j.mp3"
done
rename 's/.webm.mp3/.mp3/g' *.mp3
rename 's/.m4a.mp3/.mp3/g' *.mp3
rename 's/ /_/g' *.mp3
