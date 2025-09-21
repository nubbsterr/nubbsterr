#!/usr/bin/env bash

# prints mem usage percent
ram_usage=$(free -g | awk '/^Mem:/ {print $3}')
usage=$(free | grep Mem | awk '{print int($3/$2 * 100)"%"}')
echo " 󰍛 $ram_usage GB ($usage) "
