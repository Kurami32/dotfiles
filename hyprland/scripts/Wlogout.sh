#!/bin/bash

# Check if wlogout is already running, if so, kill it
if pgrep -x "wlogout" > /dev/null; then
    pkill -x "wlogout"
    exit 0
fi

wlogout &
