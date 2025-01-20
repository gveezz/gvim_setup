let s:save_cpo = &cpoptions
set cpoptions&vim


function! s:newtralize_netrw() abort
  augroup FileExplorer
    autocmd!
  augroup END
endfunction


function! s:should_init(bufnr, path) abort
  let for_vimfm = vimfm#buffer#is_for_vimfm(a:bufnr)

  if for_vimfm && !exists('b:vimfm')
    " Deleted Vimfm buffer should be initialized
    return 1
  endif

  if for_vimfm
    " Living Vimfm buffer should not be initialized
    return 0
  endif

  return isdirectory(a:path)
endfunction


function! vimfm#event#on_bufenter() abort
  call s:newtralize_netrw()

  let bufnr = bufnr('%')
  let path = expand('%:p')

  if !s:should_init(bufnr, path)
    return
  endif

  call vimfm#init(path, 1)
endfunction


let &cpoptions = s:save_cpo
unlet s:save_cpo
