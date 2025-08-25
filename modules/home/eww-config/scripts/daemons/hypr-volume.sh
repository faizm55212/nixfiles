#!/usr/bin/env bash

# Set timeout in seconds
OSD_TIMEOUT=1
CLOSER_PID=""

# Update and open OSD
update_osd() {
  local raw volume muted
  raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
  volume=$(echo "$raw" | grep -oP '\d+\.\d+' | cut -d. -f2)
  muted=$(echo "$raw" | [[ $(grep MUTED) ]] && echo true || echo false)
  eww update volume="$volume"
  eww update muted="$muted"
  if [[ -z $(eww state | grep volume) ]]; then
    echo "opening"
    eww open volume_osd
  fi
  # Kill the previous closer if it's still running
  if [[ -n "$CLOSER_PID" ]] && kill -0 "$CLOSER_PID" 2>/dev/null; then
    kill "$CLOSER_PID"
  fi
  (
    sleep 2
    if [[ $(eww state | grep volume) ]]; then
      echo "closing"
      eww close volume_osd
    fi
  ) &
  CLOSER_PID=$!
}

# Main loop: listen for volume changes
pw-mon -a -o | grep --line-buffered 'changed' | while read -r line; do
  update_osd
done
