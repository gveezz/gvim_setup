setlocal wrap
setlocal tabstop=3
setlocal shiftwidth=3
setlocal softtabstop=0
setlocal expandtab
" setlocal textwidth=80
" setlocal wrapmargin=80
" setlocal colorcolumn=81
" stop annoying with positioning # to the beginning of the line
setlocal cinkeys-=0#
"setlocal cindent
"setlocal smartindent
setlocal formatoptions-=cro
setlocal cinwords+="begin,end,;,#"
" setlocal iskeyword-=_

let b:verilog_indent_modules=1

function! AddLineComment()

   if len(getline('.')) > 0
      silent! :s/$/ \/\/ /g
   else
      silent! :norm 80i/
   endif

endfunction

function! AddMultiLineComment()

   
   silent! :'<,'>v/\/\//s/$/ \/\/ /g
   " silent! :'<,'>v/\/\//Tab /\/\//l1
   silent! :'<,'>EasyAlign /\s\/\/ / {'lm':0,'rm':0}
   silent! :'<,'>g/\/\/$/s/\/\/$/\/\/ /g

endfunction

function! AlignComment() range

   " silent! :'<,'>Tab /\/\/
   silent! :'<,'>EasyAlign /\s\/\// {'lm':0, 'rm':1}
   silent! :'<,'>s/\s\+\/\/\s+/ \/\/ /g
endfunction

function! AlignDeclarations()

   silent! :'<,'>s# \+# #g
   " silent! :'<,'>Tab /\s\a/l0
   silent! :'<,'>EasyAlign /\s\a/ {'lm':0,'rm':0}
   " silent! :'<,'>Tab /\/\/
   silent! :'<,'>EasyAlign /\/\// {'lm':0,'rm':0}

endfunction

function! AlignParams()

   silent! :'<,'>s# \+# #g
   " :'<,'>Tab /\s[A-Z]/l0
   silent! :'<,'>EasyAlign /\s[A-Z]/ {'lm':0,'rm':0}
   " :'<,'>Tab /=
   silent! :'<,'>EasyAlign /=/ {'lm':1,'rm':1}

endfunction

function! AlignIoInstance() range

   silent! :'<,'>EasyAlign /(/ {'lm':1,'rm':0}
   silent! :'<,'>v/\/\//s/\s*)/)/g
   silent! ;'<,'>v/\/\//s/\s\+$//g

endfunction

function! AlignAssignment() range

   " silent! :'<,'>Tab /<=/
   silent! :'<,'>g/</EasyAlign /<=/ {'lm':1,'rm':1}
   " silent! :'<,'>s/\a<=/\a <=/g
   " silent! :'<,'>Tab /=/l1
   silent! :'<,'>EasyAlign /=/ {'lm':1,'rm':1}
   " silent! :'<,'>s/=\d/= /g
endfunction

function! RplcSemicolonToDot()
   
   silent! :'<,'>s/,/;/g

endfunction

function! InsertDot() range
   
   silent! :'<,'>v/\/\//normal! I.

endfunction

function! AppendComma() range
   
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//normal! A,

endfunction

function! AppendSemicolon() range
   
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//normal! A;

endfunction

function! FormatIoInstance() range

   silent! :'<,'>v/\/\//normal! I.
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//s/,$/( ),/g
   silent! :'<,'>v/\/\/\|,/normal! A( )
   " silent! :'<,'>v/\/\//Tab /(/l0
   silent! :'<,'>EasyAlign /(/ {'lm':0, 'rm': 0}
   
endfunction

function! MultiLineComment() range
   silent! :'<,'>normal! I// 
endfunction

function! HasWireRegDeclaration()
   
   if stridx(getline('.')[:col('.')-1], '\/\/') >= 0
      return 0
   else
      return stridx(getline('.'), 'reg') >= 0 || stridx(getline('.'), 'wire') >= 0
   fi
   
endfunction

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddMultiLineComment()<CR>'<<End>
xnoremap <buffer> <silent> <nowait> <M-c> :call AddMultiLineComment()<CR>'<<End>

snoremap <buffer> <silent> <nowait> <M-7> <C-o>:call AlignComment()<CR>'<<End>
xnoremap <buffer> <silent> <nowait> <M-7> :call AlignComment()<CR>'<<End>

snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call AlignAssignment()<CR>'<<End>
xnoremap <buffer> <silent> <nowait> <M-a> :call AlignAssignment()<CR>'<<End>

" inoremap <buffer> <nowait> <M-t> <C-o>:Tab /<C-R>=PromptAlign()<CR>
" snoremap <buffer> <nowait> <M-t> <C-o>:Tab /<C-R>=PromptAlign()<CR>
" xnoremap <buffer> <nowait> <M-t> :Tab /<C-R>=PromptAlign()<CR>

inoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>'<<End><C-o>:call AlignComment()<CR>
snoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>'<<End><C-o>:call AlignComment()<CR>
xnoremap <buffer> <silent> <nowait> <M-d> :call AlignDeclarations()<CR>'<<End><C-o>:call AlignComment()<CR>

inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
snoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
xnoremap <buffer> <silent> <nowait> <M-p> :call AlignParams()<CR>

snoremap <buffer> <silent> <nowait> <M-i> <C-o>:call AlignIoInstance()<CR>
xnoremap <buffer> <silent> <nowait> <M-i> :call AlignIoInstance()<CR>

inoremap <buffer> <silent> <nowait> <M-.> <C-o>:call InsertDot()<CR>
snoremap <buffer> <silent> <nowait> <M-.> <C-o>:call InsertDot()<CR>
xnoremap <buffer> <silent> <nowait> <M-.> :call InsertDot()<CR>

inoremap <buffer> <silent> <nowait> <M-,> <C-o>:call AppendComma()<CR>
snoremap <buffer> <silent> <nowait> <M-,> <C-o>:call AppendComma()<CR>
xnoremap <buffer> <silent> <nowait> <M-,> :call AppendComma()<CR>

inoremap <buffer> <silent> <nowait> <M-s> <C-o>:call RplcSemicolonToDot()<CR>
snoremap <buffer> <silent> <nowait> <M-s> <C-o>:call RplcSemicolonToDot()<CR>
xnoremap <buffer> <silent> <nowait> <M-s> :call RplcSemicolonToDot()<CR>

inoremap <buffer> <silent> <nowait> <M-;> <C-o>:call AppendSemicolon()<CR>
snoremap <buffer> <silent> <nowait> <M-;> <C-o>:call AppendSemicolon()<CR>
xnoremap <buffer> <silent> <nowait> <M-;> :call AppendSemicolon()<CR>

inoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance()<CR>
snoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance()<CR>
xnoremap <buffer> <silent> <nowait> <M-8> :call FormatIoInstance()<CR>

inoremap <buffer> <silent> <nowait> <M-j> <C-o>:call MultiLineComment()<CR>
snoremap <buffer> <silent> <nowait> <M-j> <C-o>:call MultiLineComment()<CR>
xnoremap <buffer> <silent> <nowait> <M-j> :call MultiLineComment()<CR>

inoremap <expr> <silent> <nowait> ; HasWireRegDeclaration() ? ";<Space>//<Space>COMMENT<C-S-Left>" : ";"
