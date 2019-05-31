#!/bin/bash

# Variables
volume="$(pactl list | grep -A 9 -m 1 "Sink #0" | grep Volume | cut -d " " -f 6 | cut -d "%" -f 1)"
x=1
read -p "Are you ready for the BEEP? `echo $'\n '`Enter yes(y) or no(n): " input

# Check user input
if [ $input = y  ]; then
	# Set Speaker Volume
	if [ $volume > 60  ]; then
		echo "Turning volume UP to 60%"
		pactl -- set-sink-volume 0 60%

	elif [ $volume < 60 ]; then
		echo "Turning volume DOWN to 60%"
		pactl -- set-sink-volume 0 60%
fi

	# Make Beep!
	while [ $x -le 10 ]; do
			echo "BEEP!"
			echo -ne '\a'
			sleep .5
			x=$(( $x + 1 ))
	done
	fi

if [ $input = n ]; then
	echo "Ok, fine :("
	exit
fi