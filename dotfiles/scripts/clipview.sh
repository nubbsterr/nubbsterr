#!/usr/bin/env bash
# use this only if not using vicinae lol
cliphist list | fuzzel --dmenu -p "Search clipboard: " | cliphist decode | wl-copy
