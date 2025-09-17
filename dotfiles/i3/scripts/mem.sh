#!/bin/sh
usage=$(free | grep Mem | awk '{print int($3/$2 * 100)"%"}')
echo " 󰍛 $usage "
