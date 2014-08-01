syn on
set tabstop=2
set expandtab
set autoindent

autocmd BufWritePost *.tex silent exec "!pdflatex ".bufname("%")
autocmd BufWritePost *.mt echo system("mtbuild --show-pdf=evince ".bufname("%"))

filetype plugin on

autocmd BufRead *.msa set filetype=align
autocmd BufRead *.eliom set filetype=ocaml
autocmd BufRead *.mt set filetype=tex

syn sync fromstart

set foldmethod=marker
set guioptions-=r
set guioptions-=b
set guioptions-=l
set guioptions-=m
set guioptions-=T
