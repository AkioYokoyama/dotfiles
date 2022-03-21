" My filetype file.

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd BufRead,BufNewFile *.yml setfiletype yaml
  autocmd BufRead,BufNewfile *.vim setfiletype vim
  autocmd BufRead,BufNewFile *.rb *.erb setfiletype ruby
augroup END
