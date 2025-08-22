#!/usr/bin/env bash
echo "User ID: $(id -u)"
echo "XDG_RUNTIME_DIR: $XDG_RUNTIME_DIR"
# Define the number of workspaces you want to show
NUM_WORKSPACES=10

# Function to update Eww variables
update_eww_workspaces() {
  # Get the ID of the currently focused workspace
  FOCUSED_WS=$(hyprctl activeworkspace -j | jq -r '.id')

  # Get a list of all active workspaces
  ACTIVE_WORKSPACES=$(hyprctl workspaces -j | jq -r '.[].id')

  # Reset all workspace variables to 'empty'
  for i in $(seq 1 $NUM_WORKSPACES); do
    eww update ws${i}='empty'
  done

  # Update the focused and active workspaces
  for ws_id in $ACTIVE_WORKSPACES; do
    if [[ $ws_id -ge 1 && $ws_id -le $NUM_WORKSPACES ]]; then
      # Check if the workspace has a window
      if [[ "$(hyprctl workspaces -j | jq --argjson id "$ws_id" '.[] | select(.id == $id) | .windows')" -gt 0 ]]; then
        eww update ws${ws_id}=''
      fi

      # Check if it's the focused workspace
      if [[ $ws_id -eq $FOCUSED_WS ]]; then
        eww update ws${ws_id}='focused'
      fi
    fi
  done
}

# Run once at the start
update_eww_workspaces

# Listen for events and update Eww on change
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
  if [[ $line == "workspace>>"* || $line == "focusedmon>>"* ]]; then
    echo "Got from socate $line"
    update_eww_workspaces
  fi
done
