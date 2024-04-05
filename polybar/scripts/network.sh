#!/bin/bash
color_underline=$(~/.config/polybar/scripts/getXcolor.sh color5)
connectivity=`nmcli networking connectivity`
if [ "${connectivity}" = 'full' ]
then
  color_foreground1=#009933
	echo "%{u${color_underline}} %{F${color_foreground1}} Online%{F-} %{u-}"
else
	color_foreground=#990000
  echo "%{u${color_underline}} %{F${color_foreground}} Offline%{F-} %{u-}"
fi
