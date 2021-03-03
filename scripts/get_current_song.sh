#!/bin/sh

SOCKET='/tmp/mpvsocket'

# pass the property as the first argument
mpv_communicate() {
	  printf '{ "command": ["get_property", "%s"] }\n' "$1" | socat - "${SOCKET}" | jq -r ".data"
  }

ARTIST="$(mpv_communicate "metadata/list/0/value")"
TITLE="$(mpv_communicate "metadata/list/1/value")"
PAUSED="$(mpv_communicate "core-idle")"

if [ "$PAUSED" = true ]
then
	OUTPUT="♫ ⏸ $ARTIST - $TITLE"
else
	OUTPUT="♫ $ARTIST - $TITLE"
fi

if [ ! -z "$ARTIST" ]
then
	printf "%s\n" "$OUTPUT"
fi

