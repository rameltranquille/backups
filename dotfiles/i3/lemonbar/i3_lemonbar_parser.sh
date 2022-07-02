#!/bin/bash
#
# Input parser for i3 bar
# 14 ago 2015 - Electro7

# config

# min init
title="%{F${color_head} B${color_sec_b2}}${sep_right}%{F${color_head} B${color_sec_b2}%{T2} ${icon_prog} %{F${color_sec_b2} B-}${sep_right}%{F- B- T1}"

# parser
while read -r line ; do
  case $line in
    WSP*)
      # I3 Workspaces
      # wsp="%{F${color_back} B${color_head}} %{T2}${icon_wsp}%{T1}"
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
  # printf "%s\n" "${wsp} ${title}"
  echo "${wsp} ${title}"
  # printf "%s\n" "${wsp} ${title}"
  # printf "%s\n" "%{l}${title}"
done
