setlocal colorcolumn=80
setlocal wrap
" setlocal comments="/*,\/\/"
setlocal formatoptions=joqmtcrn
setlocal wrapmargin=80
setlocal textwidth=80
setlocal linebreak
setlocal tabstop=3
setlocal shiftwidth=3
setlocal softtabstop=0
setlocal expandtab
" stop annoying with positioning # to the beginning of the line
setlocal cinkeys-=0#
setlocal cindent
setlocal cinwords+="begin,end,;,#"
setlocal indentkeys-=0#
" setlocal smartindent
" setlocal formatoptions-=cro

let b:verilog_indent_modules=1

" extend gvimrc inoremap for <CR>
" inoremap <expr> <buffer> <silent> <nowait> <CR> pumvisible() ? "<C-y>" : substitute(getline('.'), '\s', '', 'g')[0] == '.' ? "<CR><C-o>:call  AutoAlignIoInstance()<CR>" : "<CR>"

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddMultiLineComment(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-c> :call AddMultiLineComment(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-a> <C-o>:call PromptAlign(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call PromptAlign(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-a> :call PromptAlign(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-.> <C-o>:call InsertDot(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-.> <C-o>:call InsertDot(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-.> :call InsertDot(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-,> <C-o>:call AppendComma(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-,> <C-o>:call AppendComma(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-,> :call AppendComma(line("'<"),line("'>"))<CR>

" inoremap <buffer> <silent> <nowait> <M-s> <C-o>:call RplcSemicolonToDot(line("."),line("."))<CR>
" snoremap <buffer> <silent> <nowait> <M-s> <C-o>:call RplcSemicolonToDot(line("'<"),line("'>"))<CR>
" xnoremap <buffer> <silent> <nowait> <M-s> :call RplcSemicolonToDot(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-;> <C-o>:call AppendSemicolon(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-;> <C-o>:call AppendSemicolon(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-;> :call AppendSemicolon(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-8> :call FormatIoInstance(line("'<"),line("'>"))<CR>

inoremap <buffer> <silent> <nowait> <M-j> <C-o>:call MultiLineComment(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-j> <C-o>:call MultiLineComment(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-j> :call MultiLineComment(line("'<"),line("'>"))<CR>

inoremap <expr> <silent> <nowait> , HasIODeclaration() ? ",<Space>//<Space>COMMENT<C-S-Left>" : ","
inoremap <expr> <silent> <nowait> ; HasDeclaration() ? ";<Space>//<Space>COMMENT<C-S-Left>" : ";"

command! -nargs=0 AddLineComment call AddLineComment()
command! -nargs=0 AddMultiLineCommentI call AddMultiLineComment(line("."),line('.'))
command! -nargs=0 AddMultiLineCommentV call AddMultiLineComment(line("'<"),line("'>"))
command! -nargs=0 PromptAlignV call PromptAlign(line("'<"),line("'>"))

command!-nargs=0 AlignAssignmentV call AlignAssignment(line("'<"),line("'>"))
command!-nargs=0 VAlignCommentV call VAlignComment(line("'<"),line("'>"))
command!-nargs=0 AlignCommentV call AlignComment(line("'<"),line("'>"))
command!-nargs=0 AlignDeclarationsV call AlignDeclarations(line("'<"),line("'>"))
command!-nargs=0 AlignParamsV call AlignParams(line("'<"),line("'>"))
command!-nargs=0 AlignIoInstanceV call AlignIoInstance(line("'<"),line("'>"))
command!-nargs=0 AutoAlignIoInstanceV call AutoAlignIoInstance(line("'<"),line("'>"))
command!-nargs=0 RplcSemicolonToDotV call RplcSemicolonToDot(line("'<"),line("'>"))
command!-nargs=0 InsertDotV call InsertDot(line("'<"),line("'>"))
command!-nargs=0 AppendCommaV call AppendComma(line("'<"),line("'>"))
command!-nargs=0 AppendSemicolonV call AppendSemicolon(line("'<"),line("'>"))
command!-nargs=0 FormatIoInstanceV call FormatIoInstance(line("'<"),line("'>"))
command!-nargs=0 MultiLineCommentV call MultiLineComment(line("'<"),line("'>"))

function! AddLineComment()
   if len(getline('.')) > 0
      silent! :s/$/ gn\/ /g
   else
      silent! :norm 80i/
   endif
endfunction

function! AddMultiLineComment(fline, lline) range

   silent! exec ":".a:fline.",".a:lline."v/^\\s\\+\\/\\//s/$/ \\/\\/ /g"
   silent! exec ":".a:fline.",".a:lline."v/^\\s\\+\\/\\/EasyAlign /\\s\\/\\/ / {'lm':0,'rm':0}"
   silent! exec ":".a:fline.",".a:lline."g/\\/\\//s/\\/\\/$/\\/\\/ /g"

endfunction

" Pending fix
function! PromptAlign(fline, lline) range
   call inputrestore()
   let l:sel = input("Select alignment: [a]ssignment -  [c]omment - [d]eclaration - [p]arams - [io] instance: ")
   call inputsave()

   "echom "'<,'>= ".line("'<")." ".line("'>") | 2sleep
   if l:sel == 'a'
      call AlignAssignment(a:fline, a:lline)
   elseif l:sel == 'c'
      call AlignComment(a:fline, a:lline)
   elseif l:sel == 'd'
      call AlignDeclarations(a:fline, a:lline)
      call AlignComment(a:fline, a:lline)
   elseif l:sel == 'p'
      call AlignParams(a:fline, a:lline)
   elseif l:sel == 'io'
      call AlignIoInstance(a:fline, a:lline)
   endif
endfunction

function! AlignAssignment(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."EasyAlign /=/ {'lm':1,'rm':1}"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /<=/ {'lm':1,'rm':1}"
   silent! exec ":".a:fline.",".a:lline."s/\\\s=/=/g"
endfunction

function! AlignComment(fline, lline) 
   silent! exec ":".a:fline.",".a:lline."EasyAlign \\  {'f': 'v/^\\s\\+\\/\\//\\s\\/\\//'}"
endfunction

function! AlignDeclarations(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."s# \+# #g"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /\s\a/ {'lm':0,'rm':0}"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /\\gn\\\// {'lm':0,'rm':0}"
endfunction

function! AlignParams(fline, lline) range
  silent! exec ":".a:fline.",".a:lline."s# \+# #g"
  silent! exec ":".a:fline.",".a:lline."EasyAlign /\s[A-Z]/ {'lm':0,'rm':0}"
  silent! exec ":".a:fline.",".a:lline."EasyAlign /=/ {'lm':1,'rm':1}"
endfunction

function! AlignIoInstance(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."EasyAlign /(/ {'lm':0,'rm':0 }"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\\s\\+)/)/g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\s\+$//g"
endfunction

function! AutoAlignIoInstance()
   let l:cline = line('.')
   let l:fline = l:cline-1
   let l:done = 0

   while substitute(getline(l:fline), '\s', '', 'g')[0] == '.'
      let l:fline = l:fline-1
   endwhile

   let l:fline = l:fline+1
   if l:fline < l:cline
      call AlignIoInstance(l:fline, l:cline)
   endif
   call cursor(l:cline, col('$'))
endfunction

function! RplcSemicolonToDot(fline, lline)
   silent! exec ":".a:fline.",".a:lline."s/,/;/g"
endfunction

function! InsertDot(fline, lline) range
   exec ":".a:fline.",".a:lline."v/^\\gn^\\\//normal! I."
endfunction

function! AppendComma(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//normal! A,"
endfunction

function! AppendSemicolon(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\gn\\\//normal! A;"
endfunction

function! FormatIoInstance(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//normal! I."
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//s/\\\s\\\+$//g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//s/$/,/g"
   silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\/\\&(),/s/,$/( ),/g"
   "silent! exec ":".a:lline."v/^\\\s\\+\\\/\\\/\|,/normal! A( )"
   silent! exec ":".a:lline."s/,//g"
   silent! exec ":".a:fline.",".a:lline."EasyAlign /(/ {'lm':0,'rm':0}"
   " close above /)
endfunction

function! MultiLineComment(fline, lline) range
   silent! exec ":".a:fline.",".a:lline."normal! I// "
endfunction

function! HasWireRegDeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'reg') >= 0 ||
             \ stridx(getline('.'), 'wire') >= 0
   fi
endfunction

function! HasIODeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'input') >= 0 || 
             \ stridx(getline('.'), 'output') >= 0 ||
             \ stridx(getline('.'), 'inout') >= 0

   fi
endfunction

function! HasParamDeclaration()
   if stridx(getline('.')[:col('.')-1], '//') >= 0
      return 0
   else
      return stridx(getline('.'), 'parameter') >= 0
   fi
endfunction

function! HasDeclaration()
   return HasIODeclaration() || 
          \ HasWireRegDeclaration() || 
          \ HasParamDeclaration()
endfunction
