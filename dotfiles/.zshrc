export ZSH="/home/ramel/.oh-my-zsh"
export EDITOR="nvim"

#ZSH_THEME="aussiegeek"
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=( "aussiegeek" "arrow" "refined"
"mortalscumbag" "nanotech" "agnoster" "superjarin" "darkblood"
"af-magic" "rkj-repos")

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.

ENABLE_CORRECTION="true"

plugins=(git fzf copyfile copydir command-not-found colorize alias-finder)
ZSH_COLORIZE_STYLE="colorful"
ZSH_COLORIZE_CHROMA_FORMATTER=true-color

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# export ARCHFLAGS="-arch x86_64"
#
alias drop="cd ~/Dropbox/"
alias t="todoist"
alias calc="gnome-calculator &"
alias cav="alacritty -o font.offset.y=-1 &"
alias fetch="cpufetch --color 64,64,181:251,103,110:64,64,181:251,103,110"
alias ls='ls --color=auto'
alias la='ls -Al'
alias l='ls -CF'
alias sps='sudo pacman -S'
alias ll='ls -l'
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

############ EDITOR: Nvim
alias nv="nvim +PackerSync"
alias ni3="nvim /home/ramel/.config/i3/config"
alias ncon="nvim /home/ramel/.config/conky/conky.conf"
alias nbar="nvim /home/ramel/.config/polybar/config"
alias nzsh="nvim /home/ramel/.zshrc"
alias update="sudo pacman -Syyu"
alias nnvim='nvim /home/ramel/.config/nvim/lua/custom/init.lua'
alias nchad='nvim /home/ramel/.config/nvim/lua/custom/chadrc.lua'

############ EDITOR: Vanilla Vim
alias v="vim"
alias vi3="vim /home/ramel/.config/i3/config"
alias vcon="vim /home/ramel/.config/conky/conky.conf"
alias vbar="vim /home/ramel/.config/polybar/config"
alias vzsh="vim /home/ramel/.zshrc"
alias vrc="vim /home/ramel/.vimrc"
alias vnvim='vim /home/ramel/.config/nvim/lua/custom/init.lua'
alias vchad='vim /home/ramel/.config/nvim/lua/custom/chadrc.lua'
###############################################################
#------------FZF
###############################################################

cd_with_fzf () {
	cd $HOME && cd "$(fd -t d | fzf --bind="space:toggle-preview" --preview-window=:hidden)"
	zle reset-prompt
	}
zle -N cd_with_fzf{,} 
bindkey ^f cd_with_fzf 

colorscript -r 
