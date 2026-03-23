#!/bin/bash
# Path to your ASCII art file
ASCII_ART="/path/to/ASCII/ascii.txt"

# Get system information
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
DISK=$(df -h / | awk 'NR==2 {print $4}')
LOAD=$(awk '{print $1,$2,$3}' /proc/loadavg)
USERS=$(who | wc -l)
USERNAME=$(whoami)

# Get RAM information
RAM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_USED=$(free -m | awk '/Mem:/ {print $3}')
RAM_PERCENT=$(free -m | awk '/Mem:/ {printf "%.1f", $3/$2*100}')

# Combine ASCII art with text side-by-side
paste -d '' \
  <(cat "$ASCII_ART") \
  <(printf "\n\033[38;2;255;215;0m★ \033[1;36mWelcome, \033[38;2;255;105;180m$USERNAME\033[0m ★\n
\033[38;2;173;216;230m» Host: \033[0m$HOSTNAME
\033[38;2;173;216;230m» Uptime: \033[0m$UPTIME
\033[38;2;173;216;230m» Load: \033[0m$LOAD
\033[38;2;173;216;230m» RAM: \033[0m$RAM_USED MB / $RAM_TOTAL MB ($RAM_PERCENT%%)
\033[38;2;173;216;230m» Disk: \033[0m$DISK free
\033[38;2;173;216;230m» Users: \033[0m$USERS connected \n
\033[3;38;2;144;238;144mRemember drink water :D\033[0m
" | awk '{printf "%-45s\n", $0}')
