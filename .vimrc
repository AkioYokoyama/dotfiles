set incsearch
set ignorecase
set nohlsearch
set showmatch
set showmode
set backspace=2
set title
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set number
set list
set listchars=tab:>-,extends:<,trail:-
set smartcase
set t_Co=256
set helplang=ja,en
set showtabline=2
set background=dark
colorscheme hybrid
set hlsearch
set autoindent
set smartindent
"自動改行しない
set formatoptions=q
"Ctrl-a,Ctrl-x時のインクリメントを10進数にする
set nf=""
set nobackup
set noswapfile
set noundofile
" LEADERを,に変更
let mapleader = ","
"括弧を自動で閉じる
inoremap {<ENTER> {}<LEFT>
inoremap [<ENTER> []<LEFT>
inoremap (<ENTER> ()<LEFT>
inoremap "<ENTER> ""<LEFT>
inoremap '<ENTER> ''<LEFT>
"長い行を折り返さない(wrap:折り返す)
set nowrap
"yankでclipboardにコピーする
set clipboard+=unnamed
set clipboard=unnamedplus
"INSERTモードでのキー移動
inoremap <C-j> <DOWN>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
"INSERTモードでの文字削除
inoremap <C-d> <Delete>
"INSERTモードでバックスペースを使う
set backspace=indent,eol,start
"ノーマルモードで改行できる
noremap <CR> o<ESC>
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"ペースト切替
set pastetoggle=<C-]>
"ctags ジャンプ(list表示, 新規タブ)
nnoremap <space><space> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
"新規タブ表示
nnoremap <C-t> :tabe.<ENTER>
"ステータスライン
set laststatus=2
set statusline=%<%f\ %m%r%h%w\ %l/%L\ %P
set statusline+=%=%{fugitive#statusline()}
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}

"カレントウィンドウにのみカーソル行をハイライト
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup End
:hi clear CursorLine
"他で書き換えられたら自動で読み直す
set autoread

"NeoBundleの設定
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/.bundle'))
    NeoBundle 'MarcWeber/vim-addon-mw-utils'
    NeoBundle 'tomtom/tlib_vim'
    NeoBundle 'AkioYokoyama/vim-snipmate'
    NeoBundle 'tpope/vim-fugitive'
    NeoBundle 'vim-scripts/smarty-syntax'
    NeoBundle 'AkioYokoyama/vim-surround'
    NeoBundle 'haya14busa/vim-easymotion'
    NeoBundle 'nathanaelkane/vim-indent-guides'
    NeoBundle 'rking/ag.vim'
    NeoBundle 'vim-scripts/taglist.vim'
  call neobundle#end()
endif
filetype plugin on
filetype indent on
syntax on

"%マッチ機能拡張
runtime macros/matchit.vim
"改行時に自動でコメントが挿入されないようにする
autocmd FileType * setlocal formatoptions-=ro

" smarty設定
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.html set filetype=smarty
augroup END

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let g:tlist_php_settings = 'php;c:class;d:constant;f:function'
nnoremap <S-T> :TlistToggle<CR>
