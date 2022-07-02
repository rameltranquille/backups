
#!/bin/bash

panel_fifo="/tmp/i3-window"
activeDir="$HOME/.config/polybar/activeWindow/"
[ -e "${panel_fifo}" ] && rm "${panel_fifo}"
mkfifo "${panel_fifo}"

xprop -spy -root _NET_ACTIVE_WINDOW | sed -un 's/.*\(0x.*\)/WIN\1/p' > "${panel_fifo}" &
$(dirname $0)/i3_workspaces.pl > "${panel_fifo}" &

cat "${panel_fifo}" | $activeDir/i3_lemonbar_parser.sh 

wait
