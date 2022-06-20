# if status is-interactive
    # Commands to run in interactive sessions can go here
# end

set fish_greeting "Half Monkey, Half God, Towering Below the Stars"

#set -x PATH $PATH /home/ramel/.local/share/gem/ruby/3.0.0/bin
#export PATH=$PATH':/home/ramel/.local/share/gem/ruby/3.0.0/bin'
#export GEM_HOME=$HOME/.gem
#export GEM_PATH=$HOME/.gem

function fish_prompt
    printf '%s%s@%s %s%s ~> ' (set_color 9ece6a) $USER $hostname \
        (set_color F8F8F2) (prompt_pwd)
end


# TokyoNight Color Palette
set -l foreground c0caf5
set -l selection 33467C
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# ----------------------------------------
alias drop="cd ~/Dropbox/"
alias t="todoist"
alias calc="gnome-calculator"
alias cav="alacritty -o font.offset.y=-1 &"
alias fetch="cpufetch --color 64,64,181:251,103,110:64,64,181:251,103,110"
alias ls='ls --color=auto'
alias la='ls -Al'
alias l='ls -CF'
alias sps='sudo pacman -S'
alias ll='ls -al --sort=extension'
alias lp="sudo sh -c 'sysctl -w abi.vsyscall32=0'"
alias py='python'
alias smi='sudo make install'
alias pat='patch -p1 <'
alias mb='xrandr --output DVI-D-0 --brightness 1 && xrandr --output HDMI-0 --brightness 1'
alias dlm='youtube-dl --extract-audio --audio-format mp3'
alias due="todoist list --filter '(today|overdue|tomorrow)'"
alias updateYay="yay -Syu"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias cdi3='cd /home/ramel/.config/i3/'

alias v="vim"
alias vi3="vim /home/ramel/.config/i3/config"
alias vcon="vim /home/ramel/.config/conky/conky.conf"
alias vbar="vim /home/ramel/.config/polybar/config"
alias vzsh="vim /home/ramel/.zshrc"
alias vrc="vim /home/ramel/.vimrc"

alias wfound="cd /home/ramel/Dropbox/foundations; vim -c 'Vimwiki 2'"
alias cfound="cd /home/ramel/Dropbox/foundations/"

## MORE VIMWIKI
alias work="cd /home/ramel/Dropbox/workbench; vim -c VimwikiIndex"
alias cwork="cd /home/ramel/Dropbox/workbench/"
alias logWorkout="xdg-open /home/ramel/Dropbox/workbench/workoutLog.xlsx"
alias cheat="cd /home/ramel/Dropbox/workbench; vim cheatsheet.md"
alias op="cd /home/ramel/Dropbox/workbench/opmg; vim -c 'VimwikiIndex 2'"
alias mo="cd /home/ramel/Dropbox/workbench/mAndO; vim -c 'VimwikiIndex 3'"

###############################################################
#------------i3-Layouts
###############################################################
alias lo-notes="i3-msg 'workspace 2; append_layout /home/ramel/.config/i3/customWorkspaces/ws-notes1.json'"
# alias layout-notes-ws1="i3-msg 'workspace 1; append_layout /home/ramel/.config/i3/customWorkspaces/ws-notes1.json'"

###############################################################
#------------Shortening
###############################################################
alias open="xdg-open"
