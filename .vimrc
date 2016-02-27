" basic setting {{{
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
set ttyfast
set nobackup
set noswapfile
set noundofile
set backspace=indent,eol,start
set formatoptions=q
set pastetoggle=<C-]>
" }}}

" autocmd {{{
augroup vimrc
  autocmd!
  autocmd FileType * setlocal formatoptions-=ro
  autocmd InsertLeave * set nopaste
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
  autocmd BufNewFile,BufRead *.html set filetype=smarty
augroup End
" }}}

" colorscheme {{{
set background=dark
colorscheme hybrid
" }}}

" mapping {{{
let g:mapleader = ','
inoremap {<CR> {}<LEFT>
inoremap [<CR> []<LEFT>
inoremap (<CR> ()<LEFT>
inoremap "<CR> ""<LEFT>
inoremap '<CR> ''<LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
nnoremap Y y$
nnoremap <CR> o<ESC>
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <silent> <space><space> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
" }}}

" StatusLine {{{
set laststatus=2
set statusline=%<%f\ %m%r%h%w\ %l/%L\ %P
set statusline+=%=%{fugitive#statusline()}
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
" }}}

" NeoBundle plugin {{{
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
    NeoBundle 'Yggdroot/indentLine'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'thinca/vim-quickrun'
    NeoBundle 'Shougo/vimproc', {'build' : {'unix':'make -f make_unix.mak',},}
  call neobundle#end()
endif
filetype plugin on
filetype indent on
syntax on
" }}}

" indentLine {{{
let g:indentLine_faster = 1
" }}}

" unite {{{
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> <space>y :<C-u>Unite history/yank<CR>
nnoremap <silent> <space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <space>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <space>fb :<C-u>Unite file buffer<CR>
nnoremap <silent> <space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <space>u :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <space>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" @see http://tkengo.github.io/blog/2015/10/19/release-highway/
if executable('hw')
  let g:unite_source_grep_command = 'hw'
  let g:unite_source_grep_default_opts = '--no-group --no-color'
  let g:unite_source_grep_recursive_opt = ''
endif
" }}}
" vim:set foldmethod=marker:
" vim:set column=3
