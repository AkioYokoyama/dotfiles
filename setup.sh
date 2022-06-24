#!/bin/bash

# symbolic link
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc

# make file
touch $HOME/.local_aliases
cp $HOME/dotfiles/.gitconfig $HOME/
