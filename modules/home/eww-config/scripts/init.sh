#!/usr/bin/env bash
eww_root="$HOME/.config/eww"
eww="$eww_root/scripts"
eww_daemons="$eww/daemons"
log_dir="/tmp/eww/logs"

# mkdir -p "$log_dir"

open_all() {
  # It is important to open the background widget last to avoid it being above other widgets
  eww open-many \
    workspaces \
    bottom-bar \
    ;
  # sidebar-activator \
  # background \
}

# Start eww and widgets
pkill eww
eww daemon
sleep 3
open_all

# Start eww script daemons if not already running
# shellcheck disable=2009
running_daemons="$(ps x | grep "$eww")"
start() {
  daemon="$1"
  shift
  # log_file="${log_dir}/${daemon}.log"
  # : >"$log_file"
  if [[ $# == 0 ]]; then
    [[ "$running_daemons" == *"$eww_daemons/${daemon}"* ]] && found=true || found=false
  else
    [[ "$running_daemons" == *"$eww_daemons/${daemon} $*"* ]] && found=true || found=false
  fi

  if ! $found; then
    echo "> starting daemon ${daemon} $*"
    "$eww_daemons/${daemon}" "$@" >/dev/null 2>&1 &
  fi
}

# Initial updates
#"$eww/networks.sh" update_networks

# Daemons
start hypr-workspaces.sh
start hypr-volume.sh
#start sway-modes.py
#start sway-split-indicator.py
#start sway-dock.py
#start microphone.sh
#start brightness.sh
#start volume.sh
#start charger.sh
#start weather.sh
#start vpn.sh
#start days-of-the-week.sh
#start gpu.sh
#start kdeconnect.sh
#start uptime.sh
#start media.sh
#start alarms.sh
#start agenda.sh
#start network-scan.sh
#start network-events.sh
#start input-buffer.sh alarms
#start input-buffer.sh lockscreen
