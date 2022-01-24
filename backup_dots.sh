#!/bin/sh

init () {
	echo "Making directories"
	mkdir -p $HOME/.backup
	mkdir -p $HOME/.backup/dotfiles $HOME/.backup/doc $HOME/.backup/scriptsAndprojects
}

copy_dots () {
	for dir in $dotfiles; do
		rsync --mkpath -lptgoP $dir $HOME/.backup/dotfiles/
	done
}

copy_projects_scripts () {
	for dir in $scriptNprojects; do
		rsync -avz $dir $HOME/.backup/scriptsAndprojects/
	done
	ls $HOME/.backup/scriptsAndprojects
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
$HOME/.config/nvim/lua/custom/* $HOME/.config/alacritty/alacritty.yml
$HOME/.config/qtile/config.py $HOME/.config/conky/conky.conf
$HOME/.config/dunst/dunstrc $HOME/.xinitrc $HOME/.config/kitty/kitty.conf
$HOME/.config/polybar/ $HOME/.config/fish/config.fish
$HOME/.config/i3/i3config"

scriptNprojects="$HOME/scripts/" 
# projects="$HOME/scripts/"
# imp_docs="$HOME/docs/res.tex"

init
copy_dots
copy_projects_scripts
copy_imp_docs
git_update

true
