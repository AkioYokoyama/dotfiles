# 文字コードはUTF-8
export LANG=ja_JP.UTF-8

# Aliases
if [ -f $HOME/dotfiles/.aliases ]; then
    source $HOME/dotfiles/.aliases
fi

if [ -f $HOME/.local_aliases ]; then
    source $HOME/.local_aliases
fi

# ls
export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'

# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# lsがカラー表示になるようエイリアスを設定
case "${OSTYPE}" in
darwin*)
  # Mac
  alias ls="ls -GF"
  ;;
linux*)
  # Linux
  alias ls='ls -F --color'
  ;;
esac

# git補完
zstyle ':completion:*:*:git:*' script /usr/local/etc/bash_completion.d/git-completion.bash

# FPATHに`~/.zsh/completion`を追加
fpath=(~/.zsh/completion $fpath)
# シェル関数`compinit`の自動読み込み
autoload -Uz compinit && compinit -i

# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='[%c]'\$vcs_info_msg_0_'$ '
precmd(){ vcs_info }

if [ -e ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi
