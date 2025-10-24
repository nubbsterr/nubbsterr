#!/usr/bin/env bash

GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

if [[ $? -ne 0 ]]; then # no gpu 
    echo ""
else 
    echo "󰣇 $GPU_UTIL%  $GPU_TEMP"
fi
