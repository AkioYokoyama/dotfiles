# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source ~/.local_aliases

# git Tab補完
source /usr/local/bin/git-completion.bash

# readline setting
# bind -f $HOME/.inputrc
# bind -f $HOME/.editrc

# bind '"b":self-insert'
# bind '"m":self-insert'

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s cmdhist
shopt -s no_empty_cmd_completion
