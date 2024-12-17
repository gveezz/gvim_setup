augroup Makefile
   autocmd!
   autocmd BufReadPost,BufWritePost,BufNewFile Makefile,makefile,Makefile.*,makefile*,*.mk set filetype=make
augroup END
