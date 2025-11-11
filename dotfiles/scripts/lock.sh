# gruvbox colours
BLANK='#00000000'
DEFAULT='#83a598cc'
TEXT='#ebdbb2ff'
WRONG='#cc241dff'
VERIFYING='#b8bb26ff'

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
	--text-color $TEXT            \
	--inside-ver-color $BLANK     \
	--ring-ver-color $VERIFYING   \
	--inside-wrong-color $BLANK   \
	--ring-wrong-color $WRONG     \
	--inside-color $BLANK         \
	--ring-color $DEFAULT         \
	--line-color $BLANK           \
	--separator-color=$DEFAULT    \
	--text-ver-color=$TEXT        \
	--text-wrong-color=$TEXT      \
	--layout-text-color=$TEXT     \
	--key-hl-color=$VERIFYING     \
	--bs-hl-color=$WRONG          \
	--separator-color 00000000    \
	--grace 2 \
	--fade-in 0.2
	
