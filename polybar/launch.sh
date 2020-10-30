#!/usr/bin/bash

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

m=($(xrandr -q | grep " connected" | cut -d ' ' -f1))
if [[ "${#m[@]}" == "2" ]];then
 polybar main -c ~/.config/polybar/config.ini -l info&
 polybar right -c ~/.config/polybar/config.ini -l info&
 bspc config -m HDMI-A-0 bottom_padding 30
 bspc config -m eDP bottom_padding 0
#  polybar aux -c ~/.config/polybar/config.ini -l info&
else
 polybar eDP -c ~/.config/polybar/config.ini -l info&
 polybar eDPright -c ~/.config/polybar/config.ini -l info&
 bspc config -m eDP bottom_padding 30
fi



