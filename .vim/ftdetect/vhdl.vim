augroup Verilog

   autocmd!
   " autocmd BufWritePost,BufNewFile,BufRead *.v,*.vams,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set filetype=verilog | set textwidth=80 | set wrapmargin=0 | set linebreak
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vhdl set filetype=vhdl
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vhdl if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | :$r $HOME/.vim/templates/vhdl/vhdltemplate.vhdl | :call AdjTemplate() | %s/\/\//--/g | endif
augroup END
