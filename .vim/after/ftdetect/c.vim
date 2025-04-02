augroup C
   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile *.c,*.h set filetype=c
   autocmd BufReadPost,BufWritePost,BufNewFile *.cc,*.cpp,*.hpp set filetype=cpp
   autocmd BufReadPost,BufWritePost,BufNewFile *.c,*.cc,*.cpp if line('$') == 1 && getline(1) == '' | call InsTxtFromFile($HOME.'/.vim/templates/kd/kdheader.txt', -1) | call InsTxtFromFile($HOME.'/.vim/templates/c/ctemplate.c', line('$')) | :call AdjTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile *.h if line('$') == 1 && getline(1) == '' | call InsTxtFromFile($HOME.'/.vim/templates/kd/kdheader.txt', -1) | call InsTxtFromFile($HOME.'/.vim/templates/c/ctemplate.h', line('$')) | :call AdjTemplate() | endif
   autocmd FileType c,cpp call SetIndentMarks() | call AddFtDict()
augroup END
