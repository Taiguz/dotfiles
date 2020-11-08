week_month=$(date '+%A %d/%m/%y')
hour=$(date '+%H:%M')
color=`~/.config/polybar/scripts/getXcolor.sh color2`
color2=`~/.config/polybar/scripts/getXcolor.sh color1`
echo "%{u$color2} $week_month %{F$color}$hour%{F-} %{u-}"

