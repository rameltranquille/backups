#!/bin/bash 


killall -q polybar
mon1="DVI-D-0"
mon2="HDMI-0"
mon3="DP-0"

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    echo "$m"
    if [[ "$m" == "DVI-D-0" ]]; then
        MONITOR=$m polybar --reload bar1 &
   else 
	if [[ "$m" == "DP-0" ]]; then 
        	MONITOR=$m polybar --reload bar2 &
	fi
    fi
	if [[ "$m" == "HDMI-0" ]]; then 
        	MONITOR=$m polybar --reload bar3 &
	fi
  done
else
  polybar --reload bar1 &
fi

echo 'launched Polybar'
