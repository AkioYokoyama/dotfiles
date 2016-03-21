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
set softtabstop=4
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
set pastetoggle=<C-]>
set wildmenu
" }}}

" colorscheme {{{
set background=dark
colorscheme hybrid
" }}}

" autocmd {{{
augroup MyAutoCmd
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
  autocmd InsertLeave * set nopaste
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
  autocmd BufNewFile,BufRead *.html set filetype=smarty
augroup End
" }}}

" mapping {{{
let g:mapleader = ','
inoremap {<CR> {}<LEFT>
inoremap [<CR> []<LEFT>
inoremap (<CR> ()<LEFT>
inoremap "<CR> ""<LEFT>
inoremap '<CR> ''<LEFT>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>
inoremap <C-d> <Delete>
nnoremap Y y$
nnoremap <CR> o<ESC>
nnoremap gr gT
nnoremap <silent> <ESC><ESC> :nohlsearch<CR><ESC>
nnoremap <silent> <space><space> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <silent> <LEADER><F12> :tabnew $MYVIMRC<CR>
" }}}

" StatusLine {{{
set laststatus=2
set statusline=%<%f\ %m%r%h%w\ %l/%L\ %P
set statusline+=%=%{fugitive#statusline()}
set statusline+=%=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
" }}}

" dein plugin {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" plugin setting {{{
call dein#begin(s:dein_dir)
  let s:toml      = '~/.vim/rc/dein.toml'
  let s:lazy_toml = '~/.vim/rc/dein_lazy.toml'

  if dein#load_cache([expand('<sfile>'), s:toml, s:lazy_toml])
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#save_cache()
  endif
call dein#end()
" }}}

if dein#check_install()
  call dein#install()
endif

filetype plugin on
filetype indent on
syntax on
" }}}

" indentLine {{{
let g:indentLine_faster = 1
" }}}

" quickrun {{{
let g:quickrun_config = {
\  'watchdogs_checker/_': {
\    'hook/close_quickfix/enable_exit': 1,
\    'hook/back_window/enable_exit':    0,
\    'hook/back_window/priority_exit':  1,
\    'outputter/quickfix/open_cmd':     ''
\  },
\  'watchdogs_checker/php': {
\    'command': 'php',
\    'cmdopt':  '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
\    'exec':    '%c %o %s:p',
\    'errorformat': '%m\ in\ %f\ on\ line\ %l'
\  },
\}
"}}}

" vim-watchdogs {{{
if dein#tap('vim-watchdogs')
  function! s:watchdogs_on_source() abort
    let g:watchdogs_check_BufWritePost_enable  = 1
    let g:watchdogs_check_CursorHold_enable    = 1
  endfunction

  execute 'autocmd MyAutoCmd User' 'dein#source#vim-watchdogs'
    \ 'call s:watchdogs_on_source()'
endif
" }}}

" vdebug {{{
let g:vdebug_keymap = {
\  "run"               : "<LEADER>vr",
\  "run_to_cursor"     : "<F1>",
\  "step_over"         : "<F2>",
\  "step_into"         : "<F3>",
\  "step_out"          : "<F4>",
\  "close"             : "<LEADER>vc",
\  "detach"            : "<F7>",
\  "set_breakpoint"    : "<LEADER>vb",
\  "get_context"       : "<F11>",
\  "eval_under_cursor" : "<LEADER>ve",
\}

let g:vdebug_options= {
\  "port" : 9000,
\  "server" : 'localhost',
\  "timeout" : 20,
\  "on_close" : 'detach',
\  "break_on_open" : 1,
\  "ide_key" : '',
\  "remote_path" : "",
\  "local_path" : "",
\  "debug_window_level" : 0,
\  "debug_file_level" : 0,
\  "debug_file" : "",
\}
" }}}

" submode.vim {{{
" ウィンドウサイズの変更キーを簡易化する
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')
" }}}

" BooleanToggle {{{
nnoremap <silent> <LEADER>+ :call BooleanToggle()<CR>
function! BooleanToggle()
  let l:word = expand("<cword>")
  let l:bool = {'true': 'false', 'false': 'true'}
  if has_key(l:bool, l:word)
    let l:tmp = @a
    let @a = l:bool[l:word]
    execute 'normal "_diw'
    execute 'normal "aP'
    let @a = l:tmp
  endif
endfunction
" }}}

" vim:set foldmethod=marker:
" vim:set column=3
