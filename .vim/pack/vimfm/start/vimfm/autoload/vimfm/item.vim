let s:save_cpo = &cpoptions
set cpoptions&vim

function! vimfm#item#create(path, is_dir) abort
  let item = {}
  let item.index = -1
  let item.path = vimfm#util#normalize_path(a:path)
  let item.is_dir = a:is_dir
  let item.is_link = vimfm#item#is_link(a:path)
  
  if item.path == '\.\/' || item.path == '\.\.\/'
    let item.is_link = 0
  else
   
     let item.link_path = ''
     if item.is_link
       let item.link_path = vimfm#item#link_path(a:path)
       if isdirectory(item.link_path)
         let item.link_path = item.link_path.'/'
       endif
       
       if fnamemodify(item.link_path, ':h:p') == fnamemodify(a:path, ':h:p')
         let item.link_path = fnamemodify(item.link_path, ':.')
       endif
     endif
  endif
  
  let item.selected = 0
  let item.basename = vimfm#util#get_last_component(a:path, a:is_dir)
  return item
endfunction

function! vimfm#item#is_link(path)
   return a:path != resolve(a:path)
endfunction

function! vimfm#item#link_path(path)
   return resolve(a:path)
endfunction

function! vimfm#item#from_path(path) abort
  return vimfm#item#create(
        \ a:path,
        \ isdirectory(a:path))
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
