" setlocal colorcolumn=80
setlocal wrap
" setlocal comments="/*,\/\/"
setlocal formatoptions=joqmtcrn
setlocal wrapmargin=0
setlocal textwidth=0
" setlocal linebreak
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=0
setlocal expandtab
" stop annoying with positioning # to the beginning of the line
setlocal cinkeys-=0#
setlocal cindent
setlocal cinwords+="begin,end,;,#"
setlocal indentkeys-=0#
" setlocal smartindent
" setlocal formatoptions-=cro

inoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance(line("."),line("."))<CR>
snoremap <buffer> <silent> <nowait> <M-8> <C-o>:call FormatIoInstance(line("'<"),line("'>"))<CR>
xnoremap <buffer> <silent> <nowait> <M-8> :call FormatIoInstance(line("'<"),line("'>"))<CR>

function! FormatIoInstance(fline, lline) range
    " Substitute = with ( when parameter is found
    silent! exec ":".a:fline.",".a:lline."v/^\\\s\\+\\\/\\\//g/\\\a\\\s\\+\\\/\\\//|normal! f/y$d$O\<C-c>P^>>"
    " close above /)
endfunction
