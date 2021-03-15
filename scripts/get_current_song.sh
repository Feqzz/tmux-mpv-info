#!/bin/sh

SOCKET='/tmp/mpvsocket'

# pass the property as the first argument
mpv_communicate() {
	  printf '{ "command": ["get_property", "%s"] }\n' "$1" | socat - "${SOCKET}" | jq -r ".data"
  }

ARTIST="$(mpv_communicate "metadata/ARTIST")"

if [ -z "$ARTIST" ] || [ "$ARTIST" = "null" ]
then
	exit 0
fi

SONG_TITLE="$(mpv_communicate "metadata/TITLE")"
PAUSED="$(mpv_communicate "core-idle")"

PURPLE='#[fg=colour5]'
DEFAULT='#[default]'

if [ "$PAUSED" = true ]
then
	ICON="⏸"
else
	ICON="♫"
fi

printf "${PURPLE}$ICON${DEFAULT} $ARTIST - $SONG_TITLE"
