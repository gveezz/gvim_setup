autocmd BufEnter * startinsert
autocmd BufNewFile,BufRead *.html,*.htm set filetype=html


function! MdToPdf()

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

inoremap <buffer> <silent> <nowait> <M-p> <C-o>:call HtmlToPdf()<CR>
nnoremap <buffer> <silent> <nowait> <M-p> :call HtmlToPdf()<CR>
