let s:save_cpo = &cpoptions
set cpoptions&vim

function! vimfm#item#create(path, is_dir) abort
  let item = {}
  let item.index = -1
  let item.path = vimfm#util#normalize_path(a:path)
  let item.is_dir = a:is_dir
  let item.is_link = vimfm#item#is_link(a:path)
  let item.link_path = vimfm#util#get_last_component(vimfm#item#link_path(a:path), a:is_dir)
  let item.selected = 0
  let item.basename = vimfm#util#get_last_component(a:path, a:is_dir)
  return item
endfunction

function! vimfm#item#is_link(path)
   return a:path != resolve(a:path)
endfunction

function! vimfm#item#link_path(path)
   if a:path != resolve(a:path)
      return resolve(a:path)
   else
      return ''
   endif
endfunction

function! vimfm#item#from_path(path) abort
  return vimfm#item#create(
        \ a:path,
        \ isdirectory(a:path))
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
