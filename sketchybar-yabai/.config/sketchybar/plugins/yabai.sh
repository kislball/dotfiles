#!/usr/bin/env bash

current_workspace=$(yabai -m query --spaces | jq -r '.[] | select(."has-focus") | .label[-1:]')

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$1" = "$current_workspace" ]; then
  sketchybar --set space.$1 background.drawing=on
else
  sketchybar --set space.$1 background.drawing=off
fi
