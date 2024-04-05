#!/bin/bash
if pgrep -f "gnome-calendar" > /dev/null
then
    pkill -f gnome-calendar
else
    bspc rule -a '*' -o state=floating rectangle=1200x800+0+0 center=on follow=on
    gnome-calendar
fi
