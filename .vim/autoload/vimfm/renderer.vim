let s:save_cpo = &cpoptions
set cpoptions&vim

function! vimfm#renderer#render_item(item) abort
  if get(g:, 'vimfm_render_custom_icon', '') !=# ''
    return printf('%s%s%s',
          \ a:item.selected ? '*' : '',
          \ call(g:vimfm_render_custom_icon, [a:item]),
          \ a:item.basename . (a:item.is_dir ? '/' : ''))
  else
    if a:item.is_link
      return printf('%s%s > %s',
            \ a:item.selected ? '*' : '',
            \ a:item.basename . (a:item.is_dir ? '/' : ''),
            \ a:item.link_path)
    else
       return printf('%s%s',
          \ a:item.selected ? '*' : '',
          \ a:item.basename . (a:item.is_dir ? '/' : ''))
    endif
   endif
endfunction

function! vimfm#renderer#render_filer(items) abort
  if empty(a:items)
    return ['(no items)']
  endif

  return map(copy(a:items), 'vimfm#renderer#render_item(v:val)')
endfunction

let &cpoptions = s:save_cpo
unlet s:save_cpo
