augroup Verilog

   autocmd!
   " autocmd BufWritePost,BufNewFile,BufRead *.v,*.vams,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set filetype=verilog | set textwidth=80 | set wrapmargin=0 | set linebreak
   autocmd BufWritePost,BufNewFile,BufRead *.v,*vbkp*,*.vams,*.vh,*.vinc,*.vf set filetype=verilog
   autocmd BufWritePost,BufNewFile,BufRead *.sv*,*.svh*,*.svinc,*.svf set filetype=systemverilog
   " | setlocal iskeyword-=_
   " autocmd BufReadPost * silent! :%s/\s\+$//g
   autocmd BufWritePost,BufNewFile,BufRead *.v,*.vams,*.sv* if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vtemplate.v | :call AdjVTemplate() | endif
   autocmd BufWritePost,BufNewFile,BufRead *.vh,*.svh if line('$') == 1 && getline(1) == '' | :0r$VIMHOME/templates/vhtemplate.v | :call AdjVTemplate() | endif
   autocmd BufWritePost,BufNewFile,BufRead *.vinc,*.svinc if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vinctemplate.v | :call AdjVTemplate() | endif

augroup END
