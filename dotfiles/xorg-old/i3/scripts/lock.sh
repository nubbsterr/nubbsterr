#!/bin/sh

BLANK='#000000'
CLEAR='#ffffff'
DEFAULT='#8ADCFF'
TEXT='#DDDDDD'
WRONG='#D1003F'
VERIFYING='#0072A3'

i3lock-color \
--insidever-color=$VERIFYING \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$CLEAR         \
--bshl-color=$CLEAR          \
\
--blur 5                     \
--clock                      \
--radius 100                 \
--indicator                  \
--time-str="%H:%M:%p"        \
--date-str="%A, %B %d"       \
