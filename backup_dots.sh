#!/bin/sh

init () {
	echo "Making directories"
	mkdir -p $HOME/.backup
	mkdir -p $HOME/.backup/dotfiles $HOME/.backup/doc $HOME/.backup/scripts/
}

copy_dots () {
	for dir in $dotfiles; do
		rsync -drzvP $dir $HOME/.backup/dotfiles/
	done
}

copy_scripts () {
	for dir in $scripts; do
		rsync -avz $dir $HOME/.backup/scripts/
	done
	ls $HOME/.backup/scripts
}

copy_imp_docs () {
	for dir in $imp_docs; do
		rsync -lptgoP $dir $HOME/.backup/doc/
	done
}

git_update () {
	git add . 
	git commit -m 'normal .backup'
	git push -u origin main
}

HOME="/home/ramel"

dotfiles="$HOME/.bashrc $HOME/.zshrc $HOME/.vimrc $HOME/.zshAliases 
$HOME/.config/nvim/lua/custom $HOME/.config/alacritty/alacritty.yml
$HOME/.config/qtile/config.py $HOME/.config/conky/conky.conf
$HOME/.config/dunst/dunstrc $HOME/.xinitrc $HOME/.config/kitty/kitty.conf
$HOME/.config/polybar $HOME/.config/fish/config.fish
$HOME/.config/i3 $HOME/.newsboat"

scripts="$HOME/Scripts/" 

init
copy_dots
copy_scripts
copy_imp_docs
git_update

true
