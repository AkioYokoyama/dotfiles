#!/bin/bash

ZSH_COMPLETION_PATH=$HOME/.zsh/completion

if [ ! -d $ZSH_COMPLETION_PATH ]; then
    mkdir -p $ZSH_COMPLETION_PATH
fi

cd $ZSH_COMPLETION_PATH

curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git

cd $HOME/.zsh
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
