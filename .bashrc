# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
source $HOME/.aliases

# readline setting
bind -f $HOME/.inputrc
bind -f $HOME/.editrc

bind '"b":self-insert'
bind '"m":self-insert'

shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s cmdhist
shopt -s no_empty_cmd_completion
