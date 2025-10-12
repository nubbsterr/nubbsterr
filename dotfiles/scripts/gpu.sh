#!/usr/bin/env bash

GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

echo "󰣇 $GPU_UTIL%  $GPU_TEMP"
