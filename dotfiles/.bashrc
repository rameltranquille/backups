shopt -s autocd
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=-1
HISTFILESIZE=-1

export PS1="\[\033[38;5;10m\]\W\[$(tput sgr0)\] > \[$(tput sgr0)\]"""
# export PS1="[\[$(tput sgr0)\]\[\033[38;5;13m\]\T\[$(tput sgr0)\]]\[$(tput sgr0)\]\[\033[38;5;13m\]\u@\[$(tput sgr0)\]\[\033[38;5;10m\]\w\[$(tput sgr0)\]>\[$(tput sgr0)\]"""

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -A'
alias l='ls -CF'
alias sps='sudo pacman -S'
alias ex='exit'
alias ll='ls -la'
alias lp="sudo sh -c 'sysctl -w abi.vsyscall32=0'"
alias py='python'
alias smi='sudo make install'
alias pat='patch -p1 <'
alias comp='cp -f /home/ramel/notebook/competitiveprogramming/template.cpp challenge.cpp && vim -n challenge.cpp'
alias compy='cp -f ~/notebook/competitiveprogramming/template.py challenge.py && vim -n challenge.py'
alias dlm='youtube-dl --extract-audio --audio-format mp3'

alias cdi3='cd /home/ramel/.config/i3/'
alias ni3="nvim /home/ramel/.config/i3/config"
alias ncon="nvim /home/ramel/.config/conky/conky.conf"
alias nbar="nvim /home/ramel/.config/polybar/config"
alias nzsh="nvim /home/ramel/.zshrc"
alias update="sudo pacman -Syyu"
alias updateYay="yay -Syu"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
