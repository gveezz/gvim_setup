setlocal tabstop=4
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

" inoremap <silent> <nowait> <buffer> { {<CR><CR><CR>}<Up><Tab>
inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>

" C-j: toggle code folding
inoremap <silent> <nowait> <C-j> <C-o>zf/}<CR>
nnoremap <silent> <nowait> <C-j> zf/}<CR>
vnoremap <silent> <nowait> <C-j> <Esc><C-c>zf/}<CR><Esc>
