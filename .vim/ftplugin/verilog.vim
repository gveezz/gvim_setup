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
inoremap <buffer> <silent> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR>
snoremap <buffer> <silent> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR>
inoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>
snoremap <buffer> <silent> <nowait> <M-d> <C-o>:call AlignDeclarations()<CR>
inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
snoremap <buffer> <silent> <nowait> <M-p> <C-o>:call AlignParams()<CR>
