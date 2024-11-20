setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=0
setlocal expandtab

function! s:MdToPdf()

   let l:convProg = "pandoc"
   let l:cFileName = expand("%")
   let l:cFileNameNoExt = expand("%:r")

   if executable(l:convProg) == 1
      exec ":!".l:convProg." -f markdown-implicit_figures -t latex ".l:cFileName." -o ".l:cFileNameNoExt.".pdf"
      echom "Converted"
   else
      call EchoYellowMsg(l:convProg." not installed")
   endif

endfunction

function! s:MdToHtml()

   let l:convProg = "pandoc"
   let l:cFileName = expand("%")
   let l:cFileNameNoExt = expand("%:r")

   if executable(l:convProg) == 1
      exec ":!".l:convProg." -f markdown-implicit_figures -t html ".l:cFileName." -o ".l:cFileNameNoExt.".html"
      echom "Converted"
   else
      call EchoYellowMsg(l:convProg." not installed")
   endif

endfunction

inoremap <buffer> <silent> <nowait> <M-h> <C-o>:call <sid>MdToHtml()<CR>
nnoremap <buffer> <silent> <nowait> <M-h> :call <sid>MdToHtml()<CR>
inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call <sid>MdToPdf()<CR>
nnoremap <buffer> <silent> <nowait> <M-p> :call <sid>MdToPdf()<CR>
