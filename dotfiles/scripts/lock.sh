#!/usr/bin/env bash
# catppuccin mocha colours
BLANK='#00000000'			# clear
BLACK='1e1e2eff'			# black
TEXT='#cdd6f4ff'			# white
WRONG='#f38ba8ff'			# red
VERIFYING='#a6e3a1ff' # green
CLEAR='#fab387ff'			# yellow

swaylock \
	-F \
	-f \
	-l \
	--font "JetBrainsMono Nerd Font Propo" \
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
