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

source .zshAliases

cd_with_fzf () {
	cd $HOME && cd "$(fd -t d | fzf --bind="space:toggle-preview" --preview-window=:hidden)"
	zle reset-prompt
	}
zle -N cd_with_fzf{,} 
bindkey ^f cd_with_fzf 

colorscript -r 
