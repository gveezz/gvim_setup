" setlocal colorcolumn=80
setlocal foldignore=#
setlocal wrapmargin=0
setlocal textwidth=0
setlocal linebreak
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=0
setlocal expandtab

setlocal cindent
setlocal cinwords+="{,;,#,break"
setlocal indentkeys-=0#
setlocal cinkeys-=0#

inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>
command! -nargs=0 Decs2Defs :%s/).*{\|)\n.*{/){/g | g/.*){/normal! f{v%c;
command! -nargs=0 Astyle exec ":!astyle --style=1tbs --pad-oper --add-braces --indent=spaces=2 --break-blocks --break-closing-braces --attach-return-type --pad-return-type --mode=c --indent-cases --indent-switches --indent-preproc-block ".expand('%')
