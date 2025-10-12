# Src: https://github.com/thnikk/fuzzel-scripts/blob/master/fuzzel-powermenu.sh

#!/usr/bin/env bash

SELECTION="$(printf "1 - Lock\n2 - Suspend\n3 - Log out (Niri)\n4 - Log out (Hyprland)\n5 - Reboot\n6 - Reboot to UEFI\n7 - Shutdown" | fuzzel --dmenu -l 7 -p "Power Menu: ")" || exit 0 

case $SELECTION in
	*"Lock")
		bash ~/scripts/lock.sh;;
	*"Suspend")
		systemctl suspend;;
    *"Log out (Niri)")
		niri msg action quit;;
    *"Log out (Hyprland)")
		hyprctl dispatch exit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Shutdown")
		systemctl poweroff;;
esac
