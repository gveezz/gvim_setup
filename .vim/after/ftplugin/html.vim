function! HtmlToPdf()

   let l:convProg = "pandoc"
   let l:cFileName = expand("%")
   let l:cFileNameNoExt = expand("%:r")

   if executable(l:convProg) == 1
      exec ":!".l:convProg." -f html -t latex ".l:cFileName." -o ".l:cFileNameNoExt.".pdf"
      echom "Converted"
   else
      call EchoYellowMsg(l:convProg." not installed")
   endif

endfunction

inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call HtmlToPdf()<CR>
nnoremap <buffer> <silent> <nowait> <M-p> :call HtmlToPdf()<CR>
