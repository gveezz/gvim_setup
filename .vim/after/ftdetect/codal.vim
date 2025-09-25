augroup CODAL
   autocmd!
   autocmd BufNewFile,BufRead *.codal setf codal
   autocmd BufNewFile,BufRead *.hcodal setf codal
   autocmd FileType codal call SetIndentMarks() | call AddFtDict()
augroup END
