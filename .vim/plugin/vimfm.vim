let s:save_cpo = &cpoptions
set cpoptions&vim

if exists('g:loaded_vimfm')
  finish
endif
let g:loaded_vimfm = 1

augroup vimfm_vim
  autocmd!
  autocmd BufEnter * call vimfm#event#on_bufenter()
augroup END

function! s:set_up_default_config()
  let config_dict = {
        \   'vimfm_auto_cd': 0,
        \   'vimfm_force_delete': 1,
        \   'vimfm_linkid_str': '>',
        \   'vimfm_show_hidden_files': 1,
        \   'vimfm_use_default_mappings': 1,
        \   'vimfm_open_current_split_position': 'topleft',
        \   'vimfm_open_current_vsplit_position': 'rightbelow',
        \ }

  for var_name in keys(config_dict)
    let g:[var_name] = get(
          \ g:,
          \ var_name,
          \ config_dict[var_name])
  endfor
endfunction

call s:set_up_default_config()

command! -bar -nargs=? -complete=dir Vimfm if &ft != 'vimfm' | call vimfm#init(<f-args>) | endif
command! -bar -nargs=? -complete=dir VimfmCurDir if &ft != 'vimfm' | call vimfm#init(expand("%:p:h")) | endif

nnoremap <silent> <Plug>(vimfm-returnto-buffer)      :<C-u>call vimfm#returnto_buffer()<CR>
" Toggle
nnoremap <silent> <Plug>(vimfm-toggle-all)           :<C-u>call vimfm#toggle_all()<CR>
nnoremap <silent> <Plug>(vimfm-toggle-hidden)        :<C-u>call vimfm#toggle_hidden()<CR>
nnoremap <silent> <Plug>(vimfm-toggle-current)       :<C-u>call vimfm#toggle_current('n')<CR>
vnoremap <silent> <Plug>(vimfm-toggle-current)       :<C-u>call vimfm#toggle_current('v')<CR>
" Operations for selected items
nnoremap <silent> <Plug>(vimfm-delete-selected)      :<C-u>call vimfm#delete_selected()<CR>
nnoremap <silent> <Plug>(vimfm-fill-cmdline)         :<C-u>call vimfm#fill_cmdline()<CR>
nnoremap <silent> <Plug>(vimfm-move-selected)        :<C-u>call vimfm#move_selected()<CR>
nnoremap <silent> <Plug>(vimfm-open-selected)        :<C-u>call vimfm#open_selected('')<CR>
nnoremap <silent> <Plug>(vimfm-open-selected-split)  :<C-u>call vimfm#open_selected('split')<CR>
nnoremap <silent> <Plug>(vimfm-open-selected-vsplit) :<C-u>call vimfm#open_selected('vsplit')<CR>
nnoremap <silent> <Plug>(vimfm-rename-selected)      :<C-u>call vimfm#rename_selected()<CR>
" Operations for a item on cursor
nnoremap <silent> <Plug>(vimfm-open-current)         :<C-u>call vimfm#open_current('')<CR>
nnoremap <silent> <Plug>(vimfm-open-current-tab)     :<C-u>call vimfm#open_current('tab')<CR>
" Misc
nnoremap <silent> <Plug>(vimfm-chdir-here)           :<C-u>call vimfm#chdir_here()<CR>
nnoremap <silent> <Plug>(vimfm-mkdir)                :<C-u>call vimfm#mkdir()<CR>
nnoremap <silent> <Plug>(vimfm-new-file)             :<C-u>call vimfm#new_file()<CR>
nnoremap <silent> <Plug>(vimfm-open-home)            :<C-u>call vimfm#open('~')<CR>
nnoremap <silent> <Plug>(vimfm-open-parent)          :<C-u>call vimfm#open_parent()<CR>
nnoremap <silent> <Plug>(vimfm-open-root)            :<C-u>call vimfm#open('/')<CR>
nnoremap <silent> <Plug>(vimfm-quit)                 :<C-u>call vimfm#quit()<CR>
nnoremap <silent> <Plug>(vimfm-refresh)              :<C-u>call vimfm#refresh()<CR>

let &cpoptions = s:save_cpo
unlet s:save_cpo
