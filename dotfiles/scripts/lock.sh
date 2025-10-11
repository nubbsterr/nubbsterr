#!/usr/bin/env bash

# quite literally the default on github for swaylock-effects
# src: https://github.com/mortie/swaylock-effects

swaylock \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color 20202090 \
    --text-color DDDDDD \
	--key-hl-color a4df8f \
	--line-color 00000000 \
	--inside-color 00000060 \
	--separator-color 00000000 \
	--grace 2 \
	--fade-in 0.2

notify-send "Unlocked!"
