#!/bin/bash

process() {
	while read input; do 
		case "$input" in
		UNBLANK*)	
			/usr/bin/purple-remote "setstatus?status=available&message=" 
			notify-send DUNST_COMMAND_RESUME
			;;
		LOCK*)	
			notify-send DUNST_COMMAND_PAUSE
			/usr/bin/purple-remote "setstatus?status=away&message=" 
			keepass --lock-all
			;;
		esac
	done
}

/usr/bin/xscreensaver-command -watch | process
