#!/bin/bash

# symbolic link
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# make file
touch ~/.local_aliases
cp ~/dotfiles/.gitconfig ~/
