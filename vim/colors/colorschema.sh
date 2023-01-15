#!/bin/bash

git clone https://github.com/AkioYokoyama/vim-haruka.git
mv vim-haruka/colors/haruka.vim ./
rm -fr vim-haruka

git clone https://github.com/w0ng/vim-hybrid.git
mv vim-hybrid/colors/hybrid.vim ./
rm -fr vim-hybrid
