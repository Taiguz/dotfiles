#!/bin/bash
volume=`pactl list sinks | grep -A7 "Name:.*analog-stereo" | tail -n 1 | cut -d/ -f 2`
color_foreground=#e6e6e6
color_underline=$(~/.config/polybar/scripts/getXcolor.sh color6)
echo "%{u$color_underline}%{F$color_foreground} $volume "
