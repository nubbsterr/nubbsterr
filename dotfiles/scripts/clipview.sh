#!/usr/bin/env bash

cliphist list | rofi -dmenu -p "Search clipboard" | cliphist decode | wl-copy
