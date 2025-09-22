augroup Netrw
   autocmd!
   autocmd FileType netrw stopinsert
   autocmd FileType netrw exec ":vertical resize ".max(map(range(1, line('$')), "col([v:val, '$'])")) - 1
augroup END
