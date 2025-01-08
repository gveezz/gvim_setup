augroup Vhdl
   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vhdl set filetype=vhdl
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vhdl if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | :$r $HOME/.vim/templates/vhdl/vhdltemplate.vhdl | :call AdjTemplate() | %s/\/\//--/g | endif
   autocmd FileType vhdl call SetIndentMarks() | call AddFtDict()
augroup END
