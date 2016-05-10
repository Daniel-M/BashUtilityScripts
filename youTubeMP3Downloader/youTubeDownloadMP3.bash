#!/bin/bash 
  # A very simple Bash script to download a YouTube video 
  # and extract the music file from it. 
address=$1 
regex='v=(.*)' 
  if [[ $address =~ $regex ]]; then 
  video_id=${BASH_REMATCH[1]}
  video_id=$(echo $video_id | cut -d'&' -f1) 
  video_title="$(youtube-dl --get-title $address)" 
  echo "Gettin video $video_title"
  echo "."
	youtube-dl -f bestaudio $address 
	if [ -f	"$video_title-$video_id.m4a" ];
	then
		echo "Format m4a detected"
		ffmpeg -i "$video_title-$video_id.m4a" -acodec mp3 -ac 2 -ab 320k "$video_title.mp3"
	elif [ -f "$video_title-$video_id.webm" ];
	then
		echo "Format webm detected"
		ffmpeg -i "$video_title-$video_id.webm" -acodec mp3 -ac 2 -ab 320k "$video_title.mp3"
	fi
	rename 's/ /_/g' *.mp3
  else
	echo "Sorry but the system encountered a problem." 
  fi
