augroup C

   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile *.cpp,*.h set filetype=cpp
   autocmd BufReadPost,BufWritePost,BufNewFile *.cpp if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/c/ctemplate.c | :call AdjCTemplate() | endif
   
augroup END
