setlocal foldignore=#
"setlocal foldmarker={,}
"setlocal tabstop=4
setlocal shiftwidth=2
setlocal softtabstop=0
setlocal expandtab
setlocal nocindent

inoremap <silent> <nowait> <buffer> <M-c> <C-o>:Dox<CR>
inoremap <silent> <nowait> <buffer> <C-i> <C-o>:!astyle --style=1tbs --pad-oper --add-braces --indent=spaces=2 --break-blocks --break-closing-braces --attach-return-type --pad-return-type --mode=c --indent-cases --indent-switches --indent-preproc-block %<CR>
