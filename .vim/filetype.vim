" My filetype file.

if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  autocmd BufRead,BufNewFile *.yml setfiletype yaml
  autocmd BufRead,BufNewfile *.vim setfiletype vim
  autocmd BufRead,BufNewFile *.rb setfiletype ruby
  autocmd BufRead,BufNewFile *.erb setfiletype ruby
  autocmd BufRead,BufNewFile *.js setfiletype javascript
  autocmd BufRead,BufNewFile *.scss setfiletype scss
augroup END
