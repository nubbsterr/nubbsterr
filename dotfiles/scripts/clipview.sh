#!/usr/bin/env bash

cliphist list | fuzzel --dmenu -p "Search clipboard: " | cliphist decode | wl-copy
