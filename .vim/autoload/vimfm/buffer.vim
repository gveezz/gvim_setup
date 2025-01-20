let s:save_cpo = &cpoptions
set cpoptions&vim


function! s:map_default(mode, lhs, vimfm_command, sp_args) abort
  execute printf('%smap %s %s <Plug>(vimfm-%s)',
        \ a:mode,
        \ a:sp_args,
        \ a:lhs,
        \ a:vimfm_command)
endfunction


function! s:set_up_default_mappings() abort
  call s:map_default('n', '<Esc>', 'returnto-buffer',   '<buffer> <silent>')
   " Toggle
  call s:map_default('n', '<Space>', 'toggle-current',   '<buffer> <silent>')
  call s:map_default('n', '.',       'toggle-hidden',    '<buffer> <silent>')
  call s:map_default('n', '*',       'toggle-all',       '<buffer> <silent>')
  " call s:map_default('v', '<Space>', 'toggle-current',   '<buffer> <silent>')
  " Operations for selected items
  call s:map_default('n', 'D',       'delete-selected',  '<buffer> <nowait> <silent>')
  call s:map_default('n', 'x',       'fill-cmdline',     '<buffer> <silent>')
  call s:map_default('n', 'm',       'move-selected',    '<buffer> <silent>')
  call s:map_default('n', '<CR>',    'open-selected',    '<buffer> <silent>')
  call s:map_default('n', '<Right>', 'open-selected',    '<buffer> <silent>')
  call s:map_default('n', 'r',       'rename-selected',  '<buffer> <silent>')
  " Operations for a item on cursor
  call s:map_default('n', 'l',       'open-current',     '<buffer> <silent>')
  call s:map_default('n', 't',       'open-current-tab', '<buffer> <nowait> <silent>')
  " Misc
  call s:map_default('n', 'd',       'mkdir',            '<buffer> <silent>')
  call s:map_default('n', 'i',       'new-file',         '<buffer> <silent>')
  call s:map_default('n', '~',       'open-home',        '<buffer> <silent>')
  call s:map_default('n', '<Left>',  'open-parent',      '<buffer> <silent>')
  call s:map_default('n', '-',       'open-parent',      '<buffer> <silent>')
  call s:map_default('n', 'q',       'quit',             '<buffer> <silent>')
  call s:map_default('n', 'R',       'refresh',          '<buffer> <silent>')

  " Removed <Esc> mappings because they cause a conflict with arrow keys in terminal...
  " In terminal, arrow keys are simulated as follows:
  "   <Up>:    ^[OA
  "   <Down>:  ^[OB
  "   <Right>: ^[OC
  "   <Left>:  ^[OD
  " These keys contain ^[ (equivalent to <Esc>), so they cause quitting a Vimfm buffer.
  " nmap <buffer> <silent> <Esc>      <Plug>(vimfm-quit)
endfunction

function! s:generate_unique_bufname(path) abort
  let bufname = ''
  let index = 0

  while 1
    " Add index to avoid duplicated buffer name
    let bufname = fnameescape(printf('vimfm://%d/%s',
          \ index,
          \ a:path))
    if bufnr(bufname) < 0
      break
    endif

    let index += 1
  endwhile

  return bufname
endfunction

function! s:perform_auto_cd_if_needed(path) abort
  if !g:vimfm_auto_cd
    return
  endif

  call vimfm#chdir(a:path)
endfunction


function! s:find_lnum_for_path(filer, path) abort
  if empty(a:path)
    return 1
  endif

  let items = filter(
        \ copy(a:filer.items),
        \ 'v:val.path ==# a:path')
  if empty(items)
    return 1
  endif

  let cursor_item = items[0]
  return index(a:filer.items, cursor_item) + 1
endfunction

function! vimfm#buffer#init(filer) abort
  " Give unique name to buffer to avoid unwanted sync
  " between different windows
  execute printf('silent keepalt file %s',
        \ s:generate_unique_bufname(a:filer.dir))

  if g:vimfm_use_default_mappings
    call s:set_up_default_mappings()
  endif

  setlocal bufhidden=wipe
  setlocal buftype=nowrite
  setlocal filetype=vimfm
  setlocal matchpairs=
  setlocal noswapfile
  setlocal nowrap

  call vimfm#buffer#set_filer(a:filer)

  call vimfm#buffer#redraw()

  call s:perform_auto_cd_if_needed(a:filer.dir)
endfunction

function! vimfm#buffer#extract_path_from_bufname(bufname) abort
  let matches = matchlist(a:bufname, '^vimfm://\d\+/\(.*\)$')
  return get(matches, 1, '')
endfunction

function! vimfm#buffer#is_for_vimfm(bufnr) abort
  let bufname = bufname(a:bufnr)
  return !empty(vimfm#buffer#extract_path_from_bufname(bufname))
endfunction

function! vimfm#buffer#redraw() abort
  setlocal modifiable

  " Clear buffer before drawing items
  silent keepjumps %delete _

  let filer = vimfm#buffer#get_filer()
  call setline(1, vimfm#renderer#render_filer(filer.items))

  setlocal nomodifiable
  setlocal nomodified

  call vimfm#buffer#restore_cursor()
endfunction

function! vimfm#buffer#move_cursor_to_lnum(lnum) abort
  call cursor([a:lnum, 1, 0, 1])
endfunction

function! vimfm#buffer#restore_cursor() abort
  let filer = vimfm#buffer#get_filer()
  let cursor_path = get(filer.cursor_paths, filer.dir, '')
  let lnum = s:find_lnum_for_path(filer, cursor_path)
  call vimfm#buffer#move_cursor_to_lnum(lnum)
endfunction

function! vimfm#buffer#move_cursor_to_path(path) abort
  let filer = vimfm#buffer#get_filer()
  let lnum = s:find_lnum_for_path(filer, a:path)
  call vimfm#buffer#move_cursor_to_lnum(lnum)
endfunction

function! vimfm#buffer#redraw_item(item) abort
  setlocal modifiable

  let lnum = a:item.index + 1
  call setline(lnum, vimfm#renderer#render_item(a:item))

  setlocal nomodifiable
  setlocal nomodified
endfunction


function! vimfm#buffer#duplicate() abort
  let pos = getcurpos()

  let filer = vimfm#buffer#get_filer()
  enew
  call vimfm#buffer#init(filer)

  " Restores cursor completely
  call setpos('.', pos)
endfunction

function! vimfm#buffer#get_filer() abort
  let b:vimfm = get(b:, 'vimfm', {})
  return b:vimfm
endfunction

function! vimfm#buffer#set_filer(filer) abort
  let b:vimfm = a:filer
endfunction

function! vimfm#buffer#save_cursor(item) abort
  let filer = vimfm#buffer#get_filer()
  call vimfm#filer#save_cursor(filer, a:item.path)
  call vimfm#buffer#set_filer(filer)
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
