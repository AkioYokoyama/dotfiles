#!/bin/bash

# symbolic link
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ctags ~/.ctags

# make file
touch ~/.local_aliases
cp ~/dotfiles/.gitconfig ~/
