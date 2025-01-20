let s:save_cpo = &cpoptions
set cpoptions&vim


let s:buffer_name = 'vimfm [rename]'


function! s:set_up_syntax(items) abort
  syntax match vimfmRenamed '^.\+$'

  let lnum = 1
  for item in a:items
    execute printf('syntax match vimfmNotRenamed ''^\%%%dl%s$''',
          \ lnum,
          \ item.basename)
    let lnum += 1
  endfor

  highlight! default link vimfmNotRenamed Normal
  highlight! default link vimfmRenamed Special
endfunction


" Currently Vint doesn't have AutocmdParser so it marked as unused variable
" https://github.com/Kuniwak/vint/pull/120
" vint: -ProhibitUnusedVariable
function! s:on_bufwrite() abort
  let new_basenames = getline(1, line('$'))

  call vimfm#file#rename(
        \ b:vimfm.parent_filer,
        \ b:vimfm.items,
        \ new_basenames)
  set nomodified

  call s:redraw_parent_buffer()
endfunction
" vint: +ProhibitUnusedVariable


function! s:redraw_parent_buffer() abort
  let win_ids = vimfm#compat#win_findbuf(b:vimfm.parent_bufnr)
  if empty(win_ids)
    return
  endif

  let win_id = vimfm#compat#win_getid()
  " Redraw parent buffer if found
  if vimfm#compat#win_gotoid(win_ids[0])
    call vimfm#refresh()

    " ...and back to original window
    call vimfm#compat#win_gotoid(win_id)
  endif
endfunction


function! vimfm#rename_buffer#new(items) abort
  let bufnr = bufnr(s:buffer_name)
  if bufnr >= 0
    " Close existing rename buffer if exists
    execute printf('bwipeout %d', bufnr)
  endif

  let parent_filer = vimfm#buffer#get_filer()
  let parent_bufnr = bufnr('%')

  vnew
  file vimfm [rename]

  let lnum = 1
  for item in a:items
    call setline(lnum, item.basename)
    let lnum += 1
  endfor
  set nomodified

  setlocal buftype=acwrite
  setlocal filetype=vimfm-rename
  setlocal noswapfile
  setlocal nowrap

  let b:vimfm = {}
  let b:vimfm.parent_filer = parent_filer
  let b:vimfm.parent_bufnr = parent_bufnr
  let b:vimfm.items = a:items

  call s:set_up_syntax(a:items)

  augroup vimfm-rename
    autocmd! * <buffer>
    autocmd BufWriteCmd <buffer> call s:on_bufwrite()
  augroup END
endfunction


let &cpoptions = s:save_cpo
unlet s:save_cpo
