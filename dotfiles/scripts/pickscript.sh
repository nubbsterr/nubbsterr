#!/usr/bin/env bash
# ez stuff, just lists scripts and lets you run them w/ Mod+S

scripts=$(ls ~/scripts/*.sh 2>/dev/null | sort)
selected=$(echo "$scripts" | xargs -n1 basename| fuzzel --dmenu --placeholder "Run a script") || exit 0

bash ~/scripts/$selected
