setlocal bufhidden=wipe
setlocal foldcolumn=0

nmap <silent> <nowait> <buffer> o <CR>

if exists("g:netrw_liststyle")
   if (g:netrw_liststyle == 0 || g:netrw_liststyle == 1)
      nmap <silent> <nowait> <buffer> <Tab> <CR>
      nmap <silent> <nowait> <buffer> <S-Tab> -
   else
      nmap <silent> <nowait> <buffer> <Tab> w
      nmap <silent> <nowait> <buffer> <S-Tab> b
   endif
endif

nmap <silent> <nowait> <buffer> <Left> -
nmap <silent> <nowait> <buffer> <Right> <CR>

nmap <silent> <nowait> <buffer> <C-d> <C-6>
nmap <silent> <nowait> <buffer> <Esc> <C-6>
nmap <silent> <nowait> <buffer> <Space> t
nmap <silent> <nowait> <buffer> <C-Space> v
nmap <silent> <nowait> <buffer> <Backspace> -

nmap <silent> <nowait> <buffer> a %
nmap <silent> <nowait> <buffer> <PageUp> 3k
nmap <silent> <nowait> <buffer> <PageDown> 3j
nmap <silent> <nowait> <buffer> <2-leftmouse> <CR>
nmap <silent> <nowait> <buffer> <C-s> <nop>

cmap <expr> <silent> <nowait> <buffer> <C-CR> getcmdtype() == '/' ? "<CR><CR>" : "<CR>"


