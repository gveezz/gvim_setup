augroup Verilog

   autocmd!
   " autocmd BufWritePost,BufNewFile,BufRead *.v,*.vams,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set filetype=verilog | set textwidth=80 | set wrapmargin=0 | set linebreak
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.v,*vbkp*,*.vams,*.vh,*.vinc,*.vf set filetype=verilog
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.sv*,*.svh*,*.svinc,*.svf set filetype=systemverilog
   " | setlocal iskeyword-=_
   " autocmd BufReadPost * silent! :%s/\s\+$//g
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.v,*.vams,*.sv*,*.vinc,*.vf if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/verilog/vtemplate.v | :call AdjVTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vh,*.svh if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/verilog/vtemplate.vh | :call AdjVTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vinc,*.svinc if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/verilog/vtemplate.vinc | :call AdjVTemplate() | endif

augroup END
