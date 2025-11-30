#!/usr/bin/env bash

grim -g "$(slurp -o -r -c '#ff0000ff')" -t ppm - | satty --filename - --fullscreen --output-filename ~/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png
