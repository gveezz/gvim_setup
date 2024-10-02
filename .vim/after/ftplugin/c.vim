setlocal foldignore=#
"setlocal foldmarker={,}
"setlocal tabstop=4
setlocal shiftwidth=3
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

inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>

