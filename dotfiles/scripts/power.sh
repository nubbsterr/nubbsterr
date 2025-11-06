# Src: https://github.com/thnikk/fuzzel-scripts/blob/master/fuzzel-powermenu.sh

#!/usr/bin/env bash

SELECTION="$(printf "󰌾 Lock\n󰤄 Suspend\n󰈆 Log out\n󰑐 Reboot\n󰐥 Shutdown" | fuzzel --dmenu -l 5 -p "$(uptime -p): ")" || exit 0 

case $SELECTION in
	*"Lock")
		bash ~/scripts/lock.sh;;
	*"Suspend")
		systemctl suspend;;
  *"Log out")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	#*"Reboot to UEFI")
	#	systemctl reboot --firmware-setup;;
	*"Shutdown")
		systemctl poweroff;;
esac
