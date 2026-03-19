#!/bin/bash
# Temp monitor for nvidia GPUs
while true; do
    TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
    if [ "$TEMP" -gt 75 ]; then
        notify-send "GPU Hot!" "Temperature: ${TEMP}°C" -u critical
    fi
    sleep 60
done
