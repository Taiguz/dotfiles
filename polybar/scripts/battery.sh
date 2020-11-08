#!/bin/bash
status_battery=(`acpi -i | head -n1 | cut -d: -f2 | xargs | awk -F, '{print $1" "$2}'`)
percentage=`echo ${status_battery[1]} | cut -d% -f1`
#Battery 0: Full, 100%
#Battery 0: Discharging, 96%, 01:57:26 remaining
#Battery 0: Charging, 75%, 00:26:05 until charged
color_discharging=`~/.config/polybar/scripts/getXcolor.sh color1`
color_charging=`~/.config/polybar/scripts/getXcolor.sh color2`
color_underline=`~/.config/polybar/scripts/getXcolor.sh color4`

if [ "${status_battery[0]}" = "Full" ]
then
				echo "%{u${color_underline}}  %{u-}"
elif [ "${status_battery[0]}" = "Charging" ]
then
				echo "%{u${color_underline}} %{F${color_charging}} ${status_battery[1]}%{F-} %{u-}" 
else
				echo "%{u${color_underline}} %{F${color_discharging}} ${status_battery[1]}%{F-} %{u-}"
fi
