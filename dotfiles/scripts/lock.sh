#!/usr/bin/env bash
# mountain theme: https://github.com/mountain-theme/Mountain/blob/master/docs/fuji.org
BLANK='#00000000'			# clear
BLACK='191919ff'			# black
TEXT='#F0F0F0ff'			# white
WRONG='#AC8A8Cff'			# red
VERIFYING='#8AAC8Bff' # green
CLEAR='#C6A679ff'			# yellow

swaylock \
	-F \
	-f \
	-l \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 \
	--ring-color $BLANK \
	--key-hl-color $VERIFYING \
	--text-color $TEXT \
	--text-ver-color $VERIFYING \
	--text-wrong-color $WRONG \
	--line-color 00000000 \
	--inside-color $BLACK \
	--inside-ver-color $BLACK \
	--inside-wrong-color $BLACK \
	--ring-ver-color $VERIFYING \
	--ring-wrong-color $WRONG \
	--separator-color 00000000 \
	--grace 2 \
	--fade-in 0.2
