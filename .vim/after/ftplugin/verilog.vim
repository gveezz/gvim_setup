setlocal wrap
setlocal textwidth=80
setlocal tabstop=3
setlocal shiftwidth=3
setlocal softtabstop=0
setlocal expandtab
" stop annoying with positioning # to the beginning of the line
setlocal cinkeys-=0#
"setlocal cindent
"setlocal smartindent
setlocal formatoptions-=cro
setlocal cinwords+="begin,end,;,#"
" setlocal iskeyword-=_

let b:verilog_indent_modules=1

inoremap <expr> <buffer> <nowait> <CR> getline(line('.')) =~ '^\s\+\.\a' ? "<C-o>:call  <sid>AlignIoInstancePrev()<CR><CR>" : "<CR>"

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call <sid>AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call <sid>AddMultiLineComment()<CR>'<<End>
xnoremap <buffer> <silent> <nowait> <M-c> :call <sid>AddMultiLineComment()<CR>'<<End>
" 
" snoremap <buffer> <silent> <nowait> <M-7> <C-o>:call <sid>AlignComment()<CR>'<<End>
" xnoremap <buffer> <silent> <nowait> <M-7> :call <sid>AlignComment()<CR>'<<End>
" 
" snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call <sid>AlignAssignment()<CR>'<<End>
" xnoremap <buffer> <silent> <nowait> <M-a> :call <sid>AlignAssignment()<CR>'<<End>

inoremap <buffer> <silent> <nowait> <M-a> <C-o>:call <sid>PromptAlign()<CR>
snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call <sid>PromptAlign()<CR>
xnoremap <buffer> <silent> <nowait> <M-a> :call <sid>PromptAlign()<CR>

" inoremap <buffer> <silent> <nowait> <M-d> <C-o>:call <sid>AlignDeclarations()<CR>'<<End><C-o>:call <sid>AlignComment()<CR>
" snoremap <buffer> <silent> <nowait> <M-d> <C-o>:call <sid>AlignDeclarations()<CR>'<<End><C-o>:call <sid>AlignComment()<CR>
" xnoremap <buffer> <silent> <nowait> <M-d> :call <sid>AlignDeclarations()<CR>'<<End><C-o>:call <sid>AlignComment()<CR>

" inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call <sid>AlignParams()<CR>
" snoremap <buffer> <silent> <nowait> <M-p> <C-o>:call <sid>AlignParams()<CR>
" xnoremap <buffer> <silent> <nowait> <M-p> :call <sid>AlignParams()<CR>

" snoremap <buffer> <silent> <nowait> <M-i> <C-o>:call <sid>AlignIoInstance()<CR>
" xnoremap <buffer> <silent> <nowait> <M-i> :call <sid>AlignIoInstance()<CR>

inoremap <buffer> <silent> <nowait> <M-.> <C-o>:call <sid>InsertDot()<CR>
snoremap <buffer> <silent> <nowait> <M-.> <C-o>:call <sid>InsertDot()<CR>
xnoremap <buffer> <silent> <nowait> <M-.> :call <sid>InsertDot()<CR>

inoremap <buffer> <silent> <nowait> <M-,> <C-o>:call <sid>AppendComma()<CR>
snoremap <buffer> <silent> <nowait> <M-,> <C-o>:call <sid>AppendComma()<CR>
xnoremap <buffer> <silent> <nowait> <M-,> :call <sid>AppendComma()<CR>

inoremap <buffer> <silent> <nowait> <M-s> <C-o>:call <sid>RplcSemicolonToDot()<CR>
snoremap <buffer> <silent> <nowait> <M-s> <C-o>:call <sid>RplcSemicolonToDot()<CR>
xnoremap <buffer> <silent> <nowait> <M-s> :call <sid>RplcSemicolonToDot()<CR>

inoremap <buffer> <silent> <nowait> <M-;> <C-o>:call <sid>AppendSemicolon()<CR>
snoremap <buffer> <silent> <nowait> <M-;> <C-o>:call <sid>AppendSemicolon()<CR>
xnoremap <buffer> <silent> <nowait> <M-;> :call <sid>AppendSemicolon()<CR>

inoremap <buffer> <silent> <nowait> <M-8> <C-o>:call <sid>FormatIoInstance()<CR>
snoremap <buffer> <silent> <nowait> <M-8> <C-o>:call <sid>FormatIoInstance()<CR>
xnoremap <buffer> <silent> <nowait> <M-8> :call <sid>FormatIoInstance()<CR>

inoremap <buffer> <silent> <nowait> <M-j> <C-o>:call <sid>MultiLineComment()<CR>
snoremap <buffer> <silent> <nowait> <M-j> <C-o>:call <sid>MultiLineComment()<CR>
xnoremap <buffer> <silent> <nowait> <M-j> :call <sid>MultiLineComment()<CR>

inoremap <expr> <silent> <nowait> , <sid>HasIODeclaration() ? ",<Space>//<Space>COMMENT<C-S-Left>" : ","
inoremap <expr> <silent> <nowait> ; <sid>HasDeclaration() ? ";<Space>//<Space>COMMENT<C-S-Left>" : ";"

function! s:AddLineComment()
   if len(getline('.')) > 0
      silent! :s/$/ \/\/ /g
   else
      silent! :norm 80i/
   endif
endfunction

function! s:AddMultiLineComment()
   silent! :'<,'>v/\/\//s/$/ \/\/ /g
   " silent! :'<,'>v/\/\//Tab /\/\//l1
   silent! :'<,'>EasyAlign /\s\/\/ / {'lm':0,'rm':0}
   silent! :'<,'>g/\/\/$/s/\/\/$/\/\/ /g
endfunction

function! s:PromptAlign() range
   call inputrestore()
   let l:sel = input("Select alignment: a:assignment -  c:comment - d:declaration - p:params - io:input outputs instances: ")
   call inputsave()

   "echom "'<,'>= ".line("'<")." ".line("'>") | 2sleep
   if l:sel == 'a'
      call <sid>AlignAssignment()
   elseif l:sel == 'c'
      call <sid>AlignComment()
   elseif l:sel == 'd'
      call <sid>AlignDeclarations()
      call <sid>AlignComment()
   elseif l:sel == 'p'
      call <sid>AlignParams()
   elseif l:sel == 'io'
      :'<,'>call <sid>AlignIoInstanceLine()
   endif
endfunction

function! s:AlignAssignment() range
   silent! :'<,'>g/</EasyAlign /<=/ {'lm':1,'rm':1}
   silent! :'<,'>EasyAlign /=/ {'lm':1,'rm':1}
endfunction

function! s:AlignComment() range
   " silent! :'<,'>Tab /\/\/
   silent! :'<,'>EasyAlign /\s\/\// {'lm':0, 'rm':1}
   silent! :'<,'>s/\s\+\/\/\s+/ \/\/ /g
endfunction

function! s:AlignDeclarations() range
   silent! :'<,'>s# \+# #g
   " silent! :'<,'>Tab /\s\a/l0
   silent! :'<,'>EasyAlign /\s\a/ {'lm':0,'rm':0}
:   " silent! :'<,'>Tab /\/\/
   silent! :'<,'>EasyAlign /\/\// {'lm':0,'rm':0}
endfunction

function! s:AlignParams() range
   silent! :'<,'>s# \+# #g
   " :'<,'>Tab /\s[A-Z]/l0
   silent! :'<,'>EasyAlign /\s[A-Z]/ {'lm':0,'rm':0}
   " :'<,'>Tab /=
   silent! :'<,'>EasyAlign /=/ {'lm':1,'rm':1}
endfunction

function! s:AlignIoInstance() range
   silent! :'<,'>EasyAlign /(/ {'lm':1,'rm':0 }
   silent! :'<,'>v/\/\//s/\s*)/)/g
   silent! :'<,'>v/\/\//s/\s\+$//g
endfunction

function! s:AlignIoInstanceLine(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."EasyAlign /(/ {'lm':1,'rm':0 }"
   silent! exec ":".a:fline.",".a:lline."v/\/\//s/\s*)/)/g"
   silent! exec ":".a:fline.",".a:lline."v/\/\//s/\s\+$//g"
endfunction

function! s:AlignIoInstancePrev()
   let l:cline = line('.')
   let l:fline = l:cline-1
   let l:done = 0

   while !l:done 
      if getline(l:fline) =~ '^\s\+\.\a'
         let l:fline = l:fline-1
      else
         let l:done = 1
      endif
   endwhile

   let l:fline = l:fline+1
   " echom ":".l:fline.",".l:cline | 2sleep
   if l:fline < l:cline
      call <sid>AlignIoInstanceLine(l:fline, l:cline)
      call cursor(l:cline, col('$'))
   endif
   
endfunction

function! s:RplcSemicolonToDot()
   silent! :'<,'>s/,/;/g
endfunction

function! s:InsertDot() range
   silent! :'<,'>v/\/\//normal! I.
endfunction

function! s:AppendComma() range
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//normal! A,
endfunction

function! s:AppendSemicolon() range
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//normal! A;
endfunction

function! s:FormatIoInstance() range
   silent! :'<,'>v/\/\//normal! I.
   silent! ;'<,'>v/\/\//s/\s\+$//g
   silent! :'<,'>v/\/\//s/,$/( ),/g
   silent! :'<,'>v/\/\/\|,/normal! A( )
   " silent! :'<,'>v/\/\//Tab /(/l0
   silent! :'<,'>EasyAlign /(/ {'lm':0,'rm':0}
   " close above /)
endfunction

function! s:MultiLineComment() range
   silent! :'<,'>normal! I// 
endfunction

function! s:HasWireRegDeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'reg') >= 0 ||
             \ stridx(getline('.'), 'wire') >= 0
   fi
endfunction

function! s:HasIODeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'input') >= 0 || 
             \ stridx(getline('.'), 'output') >= 0 ||
             \ stridx(getline('.'), 'inout') >= 0

   fi
endfunction

function! s:HasParamDeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'parameter') >= 0
   fi
endfunction

function! s:HasDeclaration()
   return s:HasIODeclaration() || 
          \ s:HasWireRegDeclaration() || 
          \ s:HasParamDeclaration()
endfunction
