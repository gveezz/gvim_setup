augroup Markdown
   autocmd!
   autocmd BufNewFile,BufRead *.md,*markdown silent! set filetype=markdown
   autocmd BufReadPost,BufWritePost,BufNewFile,BufRead *.md,*.markdown if line('$') == 1 && getline(1) == '' | :0r $HOME/.vim/templates/markdown/mdtemplate.md
   autocmd FileType markdown call SetIndentMarks()
augroup END
