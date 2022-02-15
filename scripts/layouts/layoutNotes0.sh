#!/bin/bash

notesWorkspace='2'
i3-msg "workspace $notesWorkspace; append_layout /home/ramel/.config/i3/customWorkspaces/ws-notes1.json" &
kitty vim -c 'VimwikiIndex' &
alacritty &
alacritty &
firefox calendar.google.com brightspace.nyu.edu
echo "done"
exit
