autocmd BufEnter * startinsert
autocmd BufEnter,BufNewFile,BufRead,BufWritePost *.v,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set textwidth=80 | set wrapmargin=0 | set linebreak
   autocmd BufEnter,BufNewFile,BufRead,BufWritePost *.v,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set filetype=verilog
   autocmd BufEnter,BufNewFile,BufRead,BufWritePost *.v,*.sv if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vtemplate.v | endif
   autocmd BufEnter,BufNewFile,BufRead,BufWritePost *.vh,*.svh if line('$') == 1 && getline(1) == '' | :0r$VIMHOME/templates/vhtemplate.v | endif
   autocmd BufEnter,BufNewFile,BufRead,BufWritePost *.vinc,*.svinc if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vinctemplate.v | endif

set cinkeys+=begin,end
let b:verilog_indent_modules = 1

function! AddLineComment()

   if len(getline('.')) > 0
      :s/$/ \/\/ /g
   else
      :norm 80i/
   endif

endfunction

function! AddMultiLineComment()

   :s/$/\/\/ /g
   :'<,'>Tab /\/\/
   :'<,'>s/$/ /g

endfunction

function! AlignComment()

   :'<,'>Tab /\/\/

endfunction

function! AlignDeclarations()

   silent! :'<,'>s# \+# #g
   :'<,'>Tab /\s\a/l0

endfunction

function! AlignParams()

   silent! :'<,'>s# \+# #g
   :'<,'>Tab /\s[A-Z]/l0
   :'<,'>Tab /=

endfunction

function! PromptAlign()

   return input("Prompt the alignment char sequence:Tab /")

endfunction

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddMultiLineComment()<CR>'<<End>
snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call AlignComment()<CR>'<<End>
inoremap <buffer> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR>
snoremap <buffer> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR>
inoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>
snoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>
inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
snoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
