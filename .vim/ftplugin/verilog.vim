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

function! PromptAlign()

   return input("Prompt the alignment char sequence: ")
   
endfunction

inoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddLineComment()<CR><End>
snoremap <buffer> <silent> <nowait> <M-c> <C-o>:call AddMultiLineComment()<CR>'<<End>
snoremap <buffer> <silent> <nowait> <M-a> <C-o>:call AlignComment()<CR>'<<End>
inoremap <buffer> <silent> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR><CR>
snoremap <buffer> <silent> <nowait> <M-t> <C-o>:Tab/<C-R>=PromptAlign()<CR><CR>
