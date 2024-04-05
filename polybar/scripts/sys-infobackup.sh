#!/bin/bash
# by Paul Colby (http://colby.id.au), no rights reserved ;)
# modified for memory and disc be displayed as well by Thiago Angelo

PREV_TOTAL=0
PREV_IDLE=0
color_foreground=#e6e6e6
color_underline=$(~/.config/polybar/scripts/getXcolor.sh color7)
while true; do

  CPU=(`cat /proc/stat | grep '^cpu '`) # Get the total CPU statistics.
  unset CPU[0]                          # Discard the "cpu" prefix.
  IDLE=${CPU[4]}                        # Get the idle CPU time.

  # Calculate the total CPU time.
  TOTAL=0

  for VALUE in "${CPU[@]:0:4}"; do
    let "TOTAL=$TOTAL+$VALUE"
  done

  # Calculate the CPU usage since we last checked.
  let "DIFF_IDLE=$IDLE-$PREV_IDLE"
  let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
  let "DIFF_USAGE=(1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10"

  #Getting used memory and discs info
  used_memory=`free -m | grep Mem: | xargs | cut -d' ' -f 3`
  disc_usage_home=`df /home | tail -n1 | xargs | cut -d' ' -f 5`
  disc_usage_root=`df / | tail -n1 | xargs | cut -d' ' -f 5`


  echo "%{u$color_underline}%{F$color_foreground}  / $disc_usage_root  /home $disc_usage_home  $DIFF_USAGE%  ${used_memory}M "

  # Remember the total and idle CPU times for the next check.
  PREV_TOTAL="$TOTAL"
  PREV_IDLE="$IDLE"

  # Wait before checking again.
  sleep 10
done
