#!/bin/bash
if pgrep -f "gnome-system-monitor" > /dev/null
then
    pkill -f gnome-system-monitor
else
    bspc rule -a '*' -o state=floating center
    gnome-system-monitor
fi
