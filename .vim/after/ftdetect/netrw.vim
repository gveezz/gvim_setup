augroup Netrw
   autocmd!
   autocmd FileType netrw stopinsert " | 
            " \ setl bufhidden=wipe | 
            " \ silent! call histdel("/", "@.*$") |
            " \ silent! call histdel("/", "\a")
augroup END
