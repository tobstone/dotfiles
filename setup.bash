#!/bin/bash

flag="$@"

function relink() {
rm -Rf $1; ln -s -h -v $flag $2 $1
}

DOTFILES=$(pwd)

cd

relink .bashrc         $DOTFILES/bashrc
relink .profile        $DOTFILES/profile


relink .vim            $DOTFILES/vim
relink .vimrc          $DOTFILES/vimrc

relink .gitconfig      $DOTFILES/gitconfig
relink .gitignore      $DOTFILES/gitignore

relink bin             $DOTFILES/bin

relink .todo.cfg       $DOTFILES/todo.cfg
relink .todo.actions.d $DOTFILES/todo.actions.d

relink .ttytterrc      $DOTFILES/ttytterrc





