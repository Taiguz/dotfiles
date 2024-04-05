#!/bin/bash
if pgrep -x "pavucontrol" > /dev/null
then
    pkill pavucontrol
else
    bspc rule -a '*' -o state=floating rectangle=488x500+2060+540
    pavucontrol
fi
