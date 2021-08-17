#!/bin/sh

init () {
	echo "Making directories"
	mkdir -p $HOME/.backup
	mkdir -p $HOME/.backup/dotfiles $HOME/.backup/doc $HOME/.backup/scripts_projects
}

copy_dots () {
	for dir in $dotfiles; do
		rsync -lptgoP --exclude='*.git' $dir $HOME/.backup/dotfiles/
	done
}

copy_projects_scripts () {
	for dir in $scriptNprojects; do
		rsync -avz $dir $HOME/.backup/scripts_projects/
	done
	ls $HOME/.backup/scripts_projects
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
dotfiles="$HOME/.bashrc $HOME/.zshrc $HOME/.vimrc 
$HOME/.config/dmenu $HOME/.config/alacritty $HOME/.config/qtile
$HOME/.config/newsboat $HOME/.config/st $HOME/.config/conky/conky.conf
$HOME/.config/dunst/dunstrc $HOME/.productive_xinitrc $HOME/.fun_xinitrc"

scriptNprojects="$HOME/scripts/ $HOME/projects/" 
projects="$HOME/scripts/"
# imp_docs="$HOME/docs/res.tex"

init
copy_dots
copy_projects_scripts
copy_imp_docs
git_update

true
