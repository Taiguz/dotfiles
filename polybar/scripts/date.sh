week_month=$(date '+%A %d/%m/%y')
hour=$(date '+%H:%M')
color=#e6e6e6
color2=#e6e6e6
echo "%{u$color2} $week_month %{F$color}$hour%{F-} %{u-}"

