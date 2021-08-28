
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ramel/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# fav themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "aussiegeek" "arrow" "refined"
"mortalscumbag" "nanotech" "agnoster" "superjarin" "darkblood"
"af-magic" "rkj-repos")
# ZSH_THEME_RANDOM_IGNORED=("cloud", "pygmalion", "rgm", "mgutz", "rixius")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf copyfile copydir command-not-found colorize alias-finder)
ZSH_COLORIZE_STYLE="colorful"
# ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
ZSH_COLORIZE_CHROMA_FORMATTER=true-color

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias fetch="cpufetch --color 255,255,255:251,103,110:255,255,255:251,103,110"
alias calc="gnome-calculator &"
alias cav="alacritty -o font.offset.y=-1 &"
alias fetch="cpufetch --color 64,64,181:251,103,110:64,64,181:251,103,110"
alias cpfun="cp -f /home/ramel/.fun_xinitrc /home/ramel/.xinitrc"
alias cppro="cp -f /home/ramel/.productive_xinitrc /home/ramel/.xinitrc"
alias index="code ./index.md"
alias uas="u a +shallow"
alias uau="u a +urgent"
alias uai="u a +important"
# alias lutris_perms="sudo sh -c 'sysctl -w abi.vsyscall32=0'"
alias p='pomodoro 90 20 --notif=True --timer=True'
alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias sps='sudo pacman -S'
alias ll='ls -l'
alias lp="sudo sh -c 'sysctl -w abi.vsyscall32=0'"
alias py='python'
alias smi='sudo make install'
alias pat='patch -p1 <'
alias mb='xrandr --output DVI-D-0 --brightness 1 && xrandr --output HDMI-0 --brightness 1'
alias lb='xrandr --output DVI-D-0 --brightness .5 && xrandr --output HDMI-0 --brightness .5'
alias nb='xrandr --output DVI-D-0 --brightness .75 && xrandr --output HDMI-0 --brightness .75'
alias dlm='youtube-dl --extract-audio --audio-format mp3'
alias u='ultralist'
alias ull='ultralist l group:project'
alias v='vifm -c vifm-v'
alias uc="ultralist l due:agenda group:context"
alias up="ultralist l due:agenda group:project"
alias tod="ultralist l group:project due:tod"
alias uf="script -c \"ultralist l\"  < /dev/null | fzf --ansi"
alias ga="gcalcli agenda today tomorrow"
alias gcal="gcalcli calw && gcalcli agenda" 
alias vert_screen="xrandr --output DVI-D-0 --primary --pos 0x286 --output HDMI-0 --rotate right"
alias vi="nvim +PackerSync"

cd_with_fzf () {
	cd $HOME && cd "$(fd -t d | fzf --bind="space:toggle-preview" --preview-window=:hidden)"
	zle reset-prompt
	}
open_with_fzf () {
	fd -t f -H -I | fzf -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
	zle reset-prompt
}
zle -N cd_with_fzf{,} 
bindkey ^f cd_with_fzf 
zle -N open_with_fzf{,}
bindkey ^o open_with_fzf

ultralist l duebefore:nextweek group:project




