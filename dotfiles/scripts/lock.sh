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
	--font "JetBrainsMono Nerd Font Propo" \
	--font-size 38 \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--text-color $TEXT \
	--inside-caps-lock-color $BLANK \
	--ring-caps-lock-color $CLEAR \
	--text-caps-lock-color $TEXT \
	--ring-clear-color $CLEAR \
	--inside-clear-color $BLANK \
	--text-clear-color $TEXT \
	--inside-ver-color $BLANK \
	--ring-ver-color $VERIFYING \
	--inside-wrong-color $BLANK \
	--ring-wrong-color $WRONG \
	--inside-color $BLANK \
	--ring-color $BLANK \
	--line-color $BLANK \
	--separator-color=$TEXT \
	--text-ver-color=$TEXT \
	--text-wrong-color=$TEXT \
	--layout-text-color=$TEXT \
	--key-hl-color=$VERIFYING \
	--bs-hl-color=$WRONG \
	--separator-color $CLEAR \
	--grace 2 \
	--fade-in 0.2
