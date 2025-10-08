# Src: https://github.com/thnikk/fuzzel-scripts/blob/master/fuzzel-powermenu.sh

#!/usr/bin/env bash

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out\n4 - Reboot\n5 - Reboot to UEFI\n6 - Shutdown" | fuzzel --dmenu -l 6 -p "Power Menu: ")" || exit 0 

case $SELECTION in
	*"Lock")
		swaylock;;
	*"Suspend")
		systemctl suspend;;
	*"Log out")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Shutdown")
		systemctl poweroff;;
esac
