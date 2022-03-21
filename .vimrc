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
set clipboard=unnamed
" }}}

" colorscheme {{{
set background=dark
colorscheme hybrid
syntax on
" }}}

" filetypeによって設定を変える
filetype plugin indent on

" autocmd {{{
augroup MyAutoCmd
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
  autocmd InsertLeave * set nopaste
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
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
nnoremap <silent> <space><space> :AnyJump<CR>
nnoremap <silent> <LEADER><F12> :tabnew $MYVIMRC<CR>
nnoremap <silent> <LEADER>t :tabnew<CR>
nnoremap <silent> <LEADER>$D :%s/ *$//g<CR>
nnoremap <silent> <LEADER>hs :HoppingStart<CR>
nnoremap <silent> <LEADER>> :Vex ~<CR>
nnoremap <silent> <LEADER>< <C-w>t:close<CR>
vmap <silent> <CR> <Plug>(EasyAlign)
nnoremap <silent> <C-p> :Clap gfiles<CR>
nnoremap <silent> <LEADER>b :Clap blines<CR>
" }}}

" StatusLine {{{
set laststatus=2
set statusline=%<%f\ %m%r%h%w\ %l/%L\ %P
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

" ale {{{
" 保存時のみ実行
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" ファイルオープン時にチェックしない
let g:ale_lint_on_enter = 0
" 表示設定
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '<<'
let g:ale_linters = {'php': ['php']}

let g:ale_php_phpcs_standard = 'PSR2'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
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

" netrw {{{
let g:netrw_liststyle=3
let g:netrw_winsize=20
" }}}

" far {{{
let g:far#source='rg'
"let g:far#cwd=''
let g:far#collapse_result=1
" }}}

" blamer {{{
let g:blamer_date_format = '%y/%m/%d %H:%M'
" }}}

" sonictemplate {{{
"let g:sonictemplate_vim_template_dir = expand('~/.vim/sonictemplate')
let g:sonictemplate_vim_template_dir = [
\   '$HOME/.vim/postfix-template'
\]
" }}}

" dadbod {{{
if filereadable(expand('~/.vim/dadbod-ui/.setting'))
    source ~/.vim/dadbod-ui/.setting
    let $DBUI_URL = db . '://' . user . ':' . password . '@' . host . ':' . port . '/' . db
    let g:db_ui_table_helpers = {
\   'mysql': {
\     'Desc': 'DESC {table}',
\     'Create Table': 'SHOW CREATE TABLE {table}',
\     'Comment': 'SHOW FULL COLUMNS FROM {table}',
\     'Count': 'SELECT COUNT(*) FROM {table}'
\   }
\ }
    nnoremap <silent> <LEADER>db :DBUI<CR>
else
    echo 'There is no .setting file.'
endif
" }}}

" vim:set foldmethod=marker:
" vim:set column=3
