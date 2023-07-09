nnoremap <silent> <buffer> i <nop>
nnoremap <silent> <nowait> <buffer> <Esc> <C-w>w
nnoremap <silent> <buffer> <C-b> <nop>
nnoremap <silent> <buffer> <C-l> <nop>
nnoremap <silent> <buffer> <M-d> <nop>
nnoremap <silent> <buffer> <C-x> <nop>
nmap <silent> <buffer> <Backspace> u<Up>
silent! nunmap <CR>
nmap <silent> <buffer> <CR> o<Down>
nmap <silent> <buffer> <Tab> <Down>
nmap <silent> <buffer> <S-Tab> <Up>
nmap <silent> <buffer> <PageUp> <Up>
nmap <silent> <buffer> <PageDown> <Down>
silent! nunmap <LeftMouse>
silent! nunmap <2-LeftMouse>
silent! nunmap <3-LeftMouse>
silent! nunmap <4-LeftMouse>
nnoremap <silent> <buffer> <2-LeftMouse> <CR>
nmap <silent> <buffer> <3-LeftMouse> <2-LeftMouse>
nmap <silent> <buffer> <4-LeftMouse> <4-LeftMouse>
