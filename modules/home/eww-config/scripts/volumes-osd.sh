#!/usr/bin/env bash

# Get volume and mute state from wpctl once
raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

# Extract volume float (e.g., 0.65)
volume=$(echo "$raw" | grep -oP '\d+\.\d+')

# Detect mute state (true/false)
muted=$(echo "$raw" | grep -iq "muted: true" && echo true || echo false)

# Update eww variables
eww update volume=$volume
eww update muted=$muted

# Show popup
eww open volume_osd

# Close after 2 seconds
# sleep 2
# eww close volume_osd