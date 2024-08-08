setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=0
setlocal expandtab
setlocal nocindent

" inoremap <silent> <nowait> <buffer> { {<CR><CR><CR>}<Up><Tab>
inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>

" C-j: toggle code folding
inoremap <silent> <nowait> <C-j> <C-o>zf/}<CR>
nnoremap <silent> <nowait> <C-j> zf/}<CR>
vnoremap <silent> <nowait> <C-j> <Esc><C-c>zf/}<CR><Esc>
