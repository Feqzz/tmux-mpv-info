#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

replace_placeholder_in_status_line() {
	local placeholder="\#{$1}"
	local script="#($2)"
	local status_line_side=$3
	local old_status_line=$(get_tmux_option $status_line_side)
	local new_status_line=${old_status_line/$placeholder/$script}

	$(set_tmux_option $status_line_side "$new_status_line")
}

main() {
	local mpv_song="$CURRENT_DIR/scripts/get_current.song.sh"
	replace_placeholder_in_status_line "mpv_song" "$mpv_song" "status-right"
}

main
