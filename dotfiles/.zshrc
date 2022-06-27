export ZSH="/home/ramel/.oh-my-zsh"
export EDITOR="vim"

ZSH_THEME="random"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
ENABLE_CORRECTION="true"

plugins=(git fzf copyfile copypath command-not-found colorize alias-finder zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)
ZSH_COLORIZE_STYLE="colorful"
ZSH_COLORIZE_CHROMA_FORMATTER=true-color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=grey'
source $ZSH/oh-my-zsh.sh

cd_with_fzf () {
	cd $HOME && cd "$(fd -t d | fzf --bind="space:toggle-preview" --preview-window=:hidden)"
	zle reset-prompt
	}
zle -N cd_with_fzf{,} 
bindkey ^f cd_with_fzf 

source ~/.zshAliases
