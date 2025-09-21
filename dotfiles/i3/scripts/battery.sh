#!/usr/bin/env bash

BAT0_PATH="/sys/class/power_supply/BAT0/capacity"
BAT1_PATH="/sys/class/power_supply/BAT1/capacity"

bat0=$(\cat "$BAT0_PATH" 2>/dev/null || echo 0)
bat1=$(\cat "$BAT1_PATH" 2>/dev/null || echo 0)

avg=$(( (bat0 + bat1) / 2 ))
echo " $avg% "
