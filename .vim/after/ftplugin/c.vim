setlocal foldignore=#
"setlocal foldmarker={,}
"setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=0
setlocal expandtab
setlocal nocindent

function! AdjCTemplate ()

   let l:currYear = strftime('%Y')
   let l:buffNname = expand('%:r')
   
   silent! exec ":%s/$YEAR/".l:currYear."/g"
   silent! exec ":%s/$COMPONENT_NAME/".l:buffNname."/g"
   silent! exec ":%s/$MACRO/".toupper(l:buffNname)."/g"
   silent! :1

endfunction

" function! Fold()
"    call search('{')
"    let l:stline = line('.')+1
"    normal! %
"    let l:fnline = line('.')-1
"    silent! exec ":".l:stline.",".l:fnline."fold"
"    silent! exec ":".l:stline
"    normal! zz
" endfunction

" inoremap <silent> <nowait> <buffer> { {<CR><CR><CR>}<Up><Tab>
inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>

" C-j: toggle code fol=ding
" inoremap <buffer> <silent> <nowait> <C-.> <C-o>:call Fold()<CR>
" nnoremap <buffer> <silent> <nowait> <C-.> :call Fold()<CR>

