stopinsert
setlocal number 
setlocal relativenumber

"nnoremap <silent> <buffer> i <nop>
nnoremap <silent> <nowait> <buffer> <Esc> :NERDTreeClose<CR>
silent! nunmap <F11>
" nnoremap <silent> <buffer> i <nop>
" nnoremap <silent> <nowait> <buffer> <Esc> <C-w>w

nmap <silent> <buffer> <M-Left> <C-w>w
" nmap <silent> <expr> <buffer> <C-x> (winnr('$') == 1 && tabpagenr() == 1) ? "<C-o>:q!<CR>" : ":NERDTreeClose!<CR>"
nmap <silent> <buffer> <C-x> :close!<CR>
nnoremap <silent> <buffer> <C-b> <nop>
nnoremap <silent> <buffer> <C-l> <nop>
nnoremap <silent> <buffer> <M-d> <nop>
" nnoremap <silent> <buffer> <C-x> <nop>
nmap <silent> <buffer> <Backspace> u
silent! nunmap <CR>
nmap <silent> <buffer> <CR> o<Down>
nmap <silent> <buffer> <Tab> 3<Down>
nmap <silent> <buffer> <S-Tab> 3<Up>
nmap <silent> <buffer> <PageUp> 6<Up>
nmap <silent> <buffer> <PageDown> 6<Down>

" nmap <silent> <nowait> <buffer> a t<C-o>:call GotoTab()<CR>
