# Src: https://github.com/thnikk/fuzzel-scripts/blob/master/fuzzel-powermenu.sh

#!/usr/bin/env bash

SELECTION="$(printf "Lock\nSuspend\nLog out\nReboot\nReboot to UEFI\nShutdown" | fuzzel --dmenu -l 6 -p "$(uptime -p): ")" || exit 0 

case $SELECTION in
	*"Lock")
		bash ~/scripts/lock.sh;;
	*"Suspend")
		systemctl suspend;;
  *"Log out (Niri)")
		niri msg action quit;;
	*"Reboot")
		systemctl reboot;;
	*"Reboot to UEFI")
		systemctl reboot --firmware-setup;;
	*"Shutdown")
		systemctl poweroff;;
esac
