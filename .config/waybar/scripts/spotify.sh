#!/bin/bash

PLAYER="spotify"
FORMAT="{{ title }} - {{ artist }}"

PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
	STATUS=$PLAYERCTL_STATUS
else
	STATUS="No player is running"
fi

SongStatus=""
if [ "$1" == "--status" ]; then
	SongStatus="$STATUS"
else
	if [ "$STATUS" = "Stopped" ]; then
		SongStatus=""
	elif [ "$STATUS" = "No player is running" ]; then
		SongStatus=""
	else
		SongStatus=$(playerctl --player=$PLAYER metadata --format "$FORMAT")
		if [ "$SongStatus" = "No players found" ]; then
			SongStatus=""
		else
			SongStatus=" $SongStatus"
		fi
	fi
fi

echo -e "{\"text\":\""$SongStatus"\", \"tooltip\":\""$SongStatus"\"}"
