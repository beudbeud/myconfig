#!/bin/bash

if [ "$#" -ne 1 ]
then
	mode="check"
else
	mode="$1"
fi

muted=$(pacmd list-sources | grep -e '* index:' -A 11 | grep -Po  '(?(?<=muted: )(.*))')

if [ "$mode" == "click" ]
then
	if [ "$muted"  == "no" ]
	then
		pactl set-source-mute  $(pacmd list-sources|awk '/\* index:/{ print $3 }') 1
	else
		pactl set-source-mute  $(pacmd list-sources|awk '/\* index:/{ print $3 }') 0
	fi
else
	if [ "$muted"  == "no" ]
	then
		echo ""
		exit 0
	else
		echo ""
		exit 0
	fi
fi

