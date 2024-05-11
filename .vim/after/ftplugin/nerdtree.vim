stopinsert
setlocal number 
setlocal relativenumber

let g:NERDTreeMouseMode = 3
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeAutoDeleteBuffer=1

let g:NERDTreeMapChRoot = "<Right>"
let g:NERDTreeMapChRoot += "<Left>"
"let g:NERDTreeMapChRoot += "o"

"nnoremap <silent> <buffer> i <nop>
nnoremap <expr> <silent> <nowait> <buffer> <Esc> winnr('$') == 1 && tabpagenr('$') == 1 ? ":bw!<CR>" : ":NERDTreeClose<CR>"
silent! nunmap <F11>
" nnoremap <silent> <buffer> i <nop>
" nnoremap <silent> <nowait> <buffer> <Esc> <C-w>w

nmap <silent> <buffer> <M-Left> <C-w>w
" nmap <silent> <expr> <buffer> <C-x> (winnr('$') == 1 && tabpagenr() == 1) ? "<C-o>:q!<CR>" : ":NERDTreeClose!<CR>"
nmap <silent> <buffer> <C-x> :close!<CR>
nnoremap <silent> <buffer> <C-b> <nop>
nnoremap <silent> <buffer> <C-l> <nop>
nnoremap <silent> <buffer> <M-d> <nop>
nmap <silent> <buffer> <Backspace> u
nmap <silent> <buffer> <Left> u
nmap <silent> <buffer> <Right> o
nmap <silent> <buffer> <S-Right> s
nmap <silent> <buffer> <C-Right> t
nmap <silent> <buffer> <S-Down> i
nmap <silent> <buffer> <C-c> C

silent! nunmap <CR>
nmap <silent> <buffer> <CR> o
nmap <silent> <buffer> <Tab> 3<Down>
nmap <silent> <buffer> <S-Tab> 3<Up>
nmap <silent> <buffer> <PageUp> 6<Up>
nmap <silent> <buffer> <PageDown> 6<Down>

silent! nunmap <LeftRelease>
silent! nunmap <RightRelease>

" nmap <silent> <nowait> <buffer> a t<C-o>:call GotoTab()<CR>
