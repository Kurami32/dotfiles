#!/bin/bash
# CLipboard with cliphist, rofi, and wl-copy (Not used with DMS now)

# Variables (use absolute paths)
rofi_theme="~/.config/rofi/config-clipboard.rasi"
msg='Note: CTRL + Supr = Delete selected, ALT + Supr = Delete all'

# Kill existing rofi instances to allow toggle behavior
if pidof rofi >/dev/null; then
  pkill rofi
  exit 0  # Exit immediately after closing rofi
fi

# Generate clipboard list
cliphist list > /tmp/cliphist.list

# Launch rofi and capture exit code
result=$(rofi -i -dmenu \
  -kb-custom-1 "Control-Delete" \
  -kb-custom-2 "Alt-Delete" \
  -config "$rofi_theme" \
  -mesg "$msg" < /tmp/cliphist.list
)
rofi_exit_code=$?

# Handle actions based on exit code
case "$rofi_exit_code" in
  0)
    # Copy selected item and exit
    if [ -n "$result" ]; then
      cliphist decode <<<"$result" | wl-copy
    fi
    ;;
  10)
    # Delete selected entry
    cliphist delete <<<"$result"
    ;;
  11)
    # Wipe entire clipboard history
    cliphist wipe
    ;;
esac

# Always exit the script after handling
exit 0
