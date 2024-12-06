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

inoremap <expr> <buffer> <nowait> <CR> getline(line('.')) =~ '^\s\+\.\a' ? "<CR><C-o>:call  <sid>AutoAlignIoInstance()<CR>" : "<CR>"

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call <sid>AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call <sid>AddMultiLineComment(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-c> :call <sid>AddMultiLineComment(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-a> <C-o>:call <sid>PromptAlign(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call <sid>PromptAlign(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-a> :call <sid>PromptAlign(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-.> <C-o>:call <sid>InsertDot(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-.> <C-o>:call <sid>InsertDot(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-.> :call <sid>InsertDot(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-,> <C-o>:call <sid>AppendComma(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-,> <C-o>:call <sid>AppendComma(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-,> :call <sid>AppendComma(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-s> <C-o>:call <sid>RplcSemicolonToDot(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-s> <C-o>:call <sid>RplcSemicolonToDot(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-s> :call <sid>RplcSemicolonToDot(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-;> <C-o>:call <sid>AppendSemicolon(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-;> <C-o>:call <sid>AppendSemicolon(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-;> :call <sid>AppendSemicolon(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-8> <C-o>:call <sid>FormatIoInstance(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-8> <C-o>:call <sid>FormatIoInstance(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-8> :call <sid>FormatIoInstance(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-j> <C-o>:call <sid>MultiLineComment(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-j> <C-o>:call <sid>MultiLineComment(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-j> :call <sid>MultiLineComment(line("'<"),line("'>"))<CR>

inoremap <expr> <silent> <nowait> , <sid>HasIODeclaration() ? ",<Space>//<Space>COMMENT<C-S-Left>" : ","
inoremap <expr> <silent> <nowait> ; <sid>HasDeclaration() ? ";<Space>//<Space>COMMENT<C-S-Left>" : ";"

command! -nargs=0 AddLineComment call <sid>AddLineComment()
command! -nargs=0 AddMultiLineCommentI call <sid>AddMultiLineComment(line("."),line('.'))
command! -nargs=0 AddMultiLineCommentV call <sid>AddMultiLineComment(line("'<"),line("'>"))
command! -nargs=0 PromptAlignV call <sid>PromptAlign(line("'<"),line("'>"))

command!-nargs=0 AlignAssignmentV call<sid>AlignAssignment(line("'<"),line("'>"))
command!-nargs=0 VAlignCommentV call<sid>VAlignComment(line("'<"),line("'>"))
command!-nargs=0 AlignCommentV call<sid>AlignComment(line("'<"),line("'>"))
command!-nargs=0 AlignDeclarationsV call<sid>AlignDeclarations(line("'<"),line("'>"))
command!-nargs=0 AlignParamsV call<sid>AlignParams(line("'<"),line("'>"))
command!-nargs=0 AlignIoInstanceV call<sid>AlignIoInstance(line("'<"),line("'>"))
command!-nargs=0 AutoAlignIoInstanceV call<sid>AutoAlignIoInstance(line("'<"),line("'>"))
command!-nargs=0 RplcSemicolonToDotV call<sid>RplcSemicolonToDot(line("'<"),line("'>"))
command!-nargs=0 InsertDotV call<sid>InsertDot(line("'<"),line("'>"))
command!-nargs=0 AppendCommaV call<sid>AppendComma(line("'<"),line("'>"))
command!-nargs=0 AppendSemicolonV call<sid>AppendSemicolon(line("'<"),line("'>"))
command!-nargs=0 FormatIoInstanceV call<sid>FormatIoInstance(line("'<"),line("'>"))
command!-nargs=0 MultiLineCommentV call<sid>MultiLineComment(line("'<"),line("'>"))

function! s:AddLineComment()
   if len(getline('.')) > 0
      silent! :s/$/ gn\/ /g
   else
      silent! :norm 80i/
   endif
endfunction

function! s:AddMultiLineComment(fline, lline) range

   silent! exec ":".a:fline.",".a:lline."v/^\\s\\+\\/\\//s/$/ \\/\\/ /g"
   silent! exec ":".a:fline.",".a:lline."v/^\\s\\+\\/\\/EasyAlign /\\s\\/\\/ / {'lm':0,'rm':0}"
   silent! exec ":".a:fline.",".a:lline."g/\\/\\//s/\\/\\/$/\\/\\/ /g"

endfunction

" Pending fix
function! s:PromptAlign(fline, lline) range
   call inputrestore()
   let l:sel = input("Select alignment: a:assignment -  c:comment - d:declaration - p:params - io:input outputs instances: ")
   call inputsave()

   "echom "'<,'>= ".line("'<")." ".line("'>") | 2sleep
   if l:sel == 'a'
      call <sid>AlignAssignment(a:fline, a:lline)
   elseif l:sel == 'c'
      call <sid>AlignComment(a:fline, a:lline)
   elseif l:sel == 'd'
      call <sid>AlignDeclarations(a:fline, a:lline)
      call <sid>AlignComment(a:fline, a:lline)
   elseif l:sel == 'p'
      call <sid>AlignParams(a:fline, a:lline)
   elseif l:sel == 'io'
      call <sid>AlignIoInstance(a:fline, a:lline)
   endif
endfunction

function! s:AlignAssignment(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."EasyAlign /=/ {'lm':1,'rm':1}"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /<=/ {'lm':1,'rm':1}"
   silent! exec ":".a:fline.",".a:lline."s/\\\s=/=/g"
endfunction

function! s:AlignComment(fline, lline) 
   silent! exec ":".a:fline.",".a:lline."EasyAlign \\  {'f': 'v/^\\s\\+\\/\\//\\s\\/\\//'}"
endfunction

function! s:AlignDeclarations(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."s# \+# #g"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /\s\a/ {'lm':0,'rm':0}"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /\\gn\\\// {'lm':0,'rm':0}"
endfunction

function! s:AlignParams(fline, lline) range
  silent! exec ":".a:fline.",".a:lline."s# \+# #g"
  silent! exec ":".a:fline.",".a:lline."EasyAlign /\s[A-Z]/ {'lm':0,'rm':0}"
  silent! exec ":".a:fline.",".a:lline."EasyAlign /=/ {'lm':1,'rm':1}"
endfunction

function! s:AlignIoInstance(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."EasyAlign /(/ {'lm':1,'rm':0 }"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\s*)/)/g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\s\+$//g"
endfunction

function! s:AutoAlignIoInstance()
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
   if l:fline < l:cline
      call <sid>AlignIoInstance(l:fline, l:cline)
   endif
   call cursor(l:cline, col('$'))
endfunction

function! s:RplcSemicolonToDot(fline, lline)
   silent! exec ":".a:fline.",".a:lline."s/,/;/g"
endfunction

function! s:InsertDot(fline, lline) range
   exec ":".a:fline.",".a:lline."v/^\\gn^\\\//normal! I."
endfunction

function! s:AppendComma(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//normal! A,"
endfunction

function! s:AppendSemicolon(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//normal! A;"
endfunction

function! s:FormatIoInstance(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//normal! I."
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/,$/( ),/g"
   silent! exec ":".a:lline."v/^\\\s\\+\\gn\\\/\|,/normal! A( )"
   silent! exec ":".a:lline."s/,//g"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /(/ {'lm':0,'rm':0}"
   " close above /)
endfunction

function! s:MultiLineComment(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."normal! I// "
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
