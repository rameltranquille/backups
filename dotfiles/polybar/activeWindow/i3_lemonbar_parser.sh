#!/bin/bash
#
# Input parser for i3 bar

# parser
while read -r line ; do
  case $line in
    WSP*)
      # I3 Workspaces
      set -- ${line#???}
      while [ $# -gt 0 ] ; do
        case $1 in
         FOC*)
           wsp="${1#???}"
           ;;
         # INA*|URG*|ACT*)
           # wsp="${wsp}%{F${color_disable} T1} ${1#???} "
           # ;;
        esac
        shift
      done
      ;;
    WIN*)
      # window title
      title=$(xprop -id ${line#???} | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
      ;;
  esac

  # And finally, output
  case $wsp in
      7*)
        echo $title > $HOME/.config/polybar/activeWindow/windowOne
        ;;
      1*)
        echo $title > $HOME/.config/polybar/activeWindow/windowOne
        ;;
      2*)
        echo $title > $HOME/.config/polybar/activeWindow/windowOne
        ;;
      3*)
        echo $title > $HOME/.config/polybar/activeWindow/windowTwo
        ;;
      4*)
        echo $title > $HOME/.config/polybar/activeWindow/windowTwo
        ;;
      5*)
        echo $title > $HOME/.config/polybar/activeWindow/windowThree
        ;;
      6*)
        echo $title > $HOME/.config/polybar/activeWindow/windowThree
        ;;
esac
done

  # printf "%s\n" "${wsp} ${title}"
  # echo "${wsp}---${title}"
