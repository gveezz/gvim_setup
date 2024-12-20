augroup Netrw
   autocmd!
   autocmd FileType netrw stopinsert
   autocmd BufEnter,BufReadPost netrw silent! exec ":1"
augroup END
