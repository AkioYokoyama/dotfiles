#!/bin/bash

# setup git completion
bash $HOME/dotfiles/setup/git.sh

# symbolic link
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim

# vim setup
bash $HOME/dotfiles/.vim/colors/colorschema.sh

# make file
touch $HOME/.local_aliases
cp $HOME/dotfiles/.gitconfig $HOME/
