augroup Verilog
   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.v,*vbkp*,*.vams,*.vh,*.vinc,*.vf set filetype=verilog
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.sv*,*.svh*,*.svinc,*.svf set filetype=systemverilog
   
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.v,*.vams,*.sv* if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | if stridx(expand('%:t'), 'tb') == -1 | :$r $HOME/.vim/templates/verilog/vtemplate.v | else | :$r $HOME/.vim/templates/verilog/vtbtemplate.v | endif | :call AdjTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vh,*.svh if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | :$r $HOME/.vim/templates/verilog/vtemplate.vh | :call AdjTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vinc,*.svinc if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | :$r $HOME/.vim/templates/verilog/vtemplate.vinc | :call AdjTemplate() | endif
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.vf,*.svf if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/kd/kdheader.txt | :$r $HOME/.vim/templates/verilog/vtemplate.vf | :call AdjTemplate() | endif
   autocmd FileType verilog call SetIndentMarks() | call AddFtDict()
augroup END
