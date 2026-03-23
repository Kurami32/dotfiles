#!/bin/bash

MUSIC_FOLDER="/path/to/music-folder"
LOG_FILE="/var/log/playlist-updater.log"
FORMATS=("mp3" "flac" "wav" "ogg" "m4a" "opus")

# Loggger
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log "Starting playlist generation..."

# Counter
created_count=0
skipped_count=0

# Find all directories and generate playlists in each one
find "$MUSIC_FOLDER" -type d | while read -r dir; do
    # Skip if directory is empty
    if [ -z "$(ls -A "$dir" 2>/dev/null)" ]; then
        skipped_count=$((skipped_count + 1))
        continue
    fi
    
    # Get the folder name for the playlist
    folder_name=$(basename "$dir")
    playlist_path="$dir/${folder_name}.m3u"
    
    # Clear existing playlist
    > "$playlist_path"
    
    # Add all audio files to the playlist
    for format in "${FORMATS[@]}"; do
        find "$dir" -maxdepth 1 -type f -name "*.$format" -printf "%f\n" | sort >> "$playlist_path"
    done
    
    # Only keep the playlist if it has content
    if [ ! -s "$playlist_path" ]; then
        rm -f "$playlist_path"
        skipped_count=$((skipped_count + 1))
    else
        created_count=$((created_count + 1))
        log "Created/Updated: $playlist_path ($(wc -l < "$playlist_path") tracks)"
    fi
done

log "Playlist generation completed. Created: $created_count, Skipped: $skipped_count"
