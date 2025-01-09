setlocal colorcolumn=80
setlocal foldignore=#
setlocal wrapmargin=80
setlocal textwidth=80
setlocal linebreak
setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=0
setlocal expandtab

setlocal cinkeys-=0#
setlocal cindent
setlocal cinwords+="{,},;,#"
setlocal indentkeys-=0#

inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>

command! -nargs=0 Astyle exec ":!astyle --style=1tbs --pad-oper --add-braces --indent=spaces=2 --break-blocks --break-closing-braces --attach-return-type --pad-return-type --mode=c --indent-cases --indent-switches --indent-preproc-block ".expand('%')
