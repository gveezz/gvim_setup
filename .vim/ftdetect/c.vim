augroup C

   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile *.c,*.h set filetype=c
   autocmd BufReadPost,BufWritePost,BufNewFile *.c,*.cpp if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/c/ctemplate.c | :call AdjCTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile *.h if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/c/ctemplate.h | :call AdjCTemplate() | endif
   
augroup END
