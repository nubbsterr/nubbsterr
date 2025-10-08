#!/usr/bin/env bash
# Src: https://github.com/BreadOnPenguins/scripts/blob/master/dmenu_mpv

FOLDER=$HOME/

openvid () { \
  NAME="$(echo "$(command ls $FOLDER)" | fuzzel --dmenu -l 15 -p 'Pick a video to play:')" || exit 0
  mpv "$FOLDER$NAME" >/dev/null 2>&1
}

openvid
