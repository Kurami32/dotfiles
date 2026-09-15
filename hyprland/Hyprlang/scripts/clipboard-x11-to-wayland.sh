#!/bin/bash

# Initial sync only if there's content
content=$(xclip -o -selection clipboard 2>/dev/null)
if [[ -n "$content" ]]; then
    echo "$content" | wl-copy
fi

while true; do
    clipnotify

    # Give the X11 app time to fully set the data
    sleep 0.2

    content=$(xclip -o -selection clipboard 2>/dev/null)
    if [[ -n "$content" ]]; then
        echo "$content" | wl-copy
    fi
    # If content is empty, do nothing – keep previous Wayland clipboard
done
