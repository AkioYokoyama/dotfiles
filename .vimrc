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
set nowrap
set number
set list
set listchars=tab:>-,extends:<,trail:-
set smartcase
set t_Co=256
set helplang=ja,en
set showtabline=2
set hlsearch
set autoindent
set smartindent
set autoread
set nf=""
set nobackup
set noswapfile
set noundofile
"INSERTモードでバックスペースを使う
set backspace=indent,eol,start
"自動改行しない
set formatoptions=q
"yankでclipboardにコピーする
set clipboard+=unnamed
set clipboard=unnamedplus
set background=dark
colorscheme hybrid
" LEADERを,に変更
let mapleader = ","

inoremap {<CR> {}<LEFT>
inoremap [<CR> []<LEFT>
inoremap (<CR> ()<LEFT>
inoremap "<CR> ""<LEFT>
inoremap '<CR> ''<LEFT>
"INSERTモードでのキー移動
inoremap <C-j> <DOWN>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>

nnoremap Y y$

"ノーマルモードで改行できる
noremap <CR> o<ESC>
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"ペースト切替
set pastetoggle=<C-]>

"ctags ジャンプ(list表示, 新規タブ)
nnoremap <silent> <space><space> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

"netrwをtree表示に設定
let g:netrw_liststyle=3
nnoremap <silent> <C-t> :15Ve.<CR>

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

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=239
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=241
let g:indent_guides_guide_size = 1
