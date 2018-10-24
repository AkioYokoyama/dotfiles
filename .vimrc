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
nnoremap <C-l> 10l
nnoremap <C-h> 10h
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

" ctrlP{{{
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif
" }}}

" vim-over{{{
" 全体置換
nnoremap <silent> <Leader>r :OverCommandLine<CR>%s//g<Left><Left>
" 選択範囲置換
vnoremap <silent> <Leader>r :OverCommandLine<CR>s//g<Left><Left>
" カーソルしたの単語置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
"}}}

au BufNewFile,BufRead *.php set tags+=$HOME/php.tags
" vim:set foldmethod=marker:
" vim:set column=3
