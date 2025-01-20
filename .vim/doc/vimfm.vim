*vimfm.txt*  Lightweight file manager for Vim.


                      ______                   __________                    ~
                  ___/__/__/__  __,  _________/ __/ __/ /____                ~
                 /__/__/__/__/  | | / / _  /_  __  __/ / _, /                ~
                /__/__/__/__/   | |/ / // /_/ / / / / / ___/                 ~
                  /__/__/       |___/___^__/_/ /_/ /_/____/                  ~
                                                                             ~
                       Sweet treat for file operations                       ~


==============================================================================
0. Contents                                                  *vimfm-contents*


1. Intro .................................. |vimfm-intro|
  1.1. Concept .............................. |vimfm-concept|
  1.2. Story ................................ |vimfm-story|
  1.3. Requirements ......................... |vimfm-requirements|
2. Commands ............................... |vimfm-commands|
3. Key mappings ........................... |vimfm-key-mappings|
  3.1. Toggle selection ..................... |vimfm-key-mappings-toggle|
  3.2. Operations for the current item ...... |vimfm-key-mappings-current|
  3.3. Operations for selections ............ |vimfm-key-mappings-selected|
  3.4. Other operations ..................... |vimfm-key-mappings-others|
  3.5. Default key mappings ................. |vimfm-default-key-mappings|
4. Global options ......................... |vimfm-options|
5. Examples ............................... |vimfm-examples|
6. FAQ .................................... |vimfm-faq|
7. About .................................. |vimfm-about|


==============================================================================
1. Intro                                                        *vimfm-intro*


------------------------------------------------------------------------------
1.1. Concept                                                  *vimfm-concept*


Vimfm is...

  - a file manager >
    You can select, delete, move, rename files intuitively.
<
  - simple >
    Written in pure Vim script. Doesn't require any other plugins and not
    have too complex features: coping files, lazy loading, etc.
<

------------------------------------------------------------------------------
1.2. Story                                                      *vimfm-story*


There are already awesome file managers in the world: NERDTree, vimfiler,
Dirvish, etc. So why did I decide to develop a new file manager plugin from
scratch?

|NERDTree| is a popular file manager plugin and seems to be designed for large
window. But I uses Vim with heavy-split windows so I want to operate files
in a small window...!

|vimfiler| is full-featured file manager, maybe it can do all things you want
to do. But... it's too complex to customize and requires another plugin:
|unite|.

|dirvish| is also awesome file manager. But it's a "minimalist directory
viewer" and needs some effort to operate (select multiple, delete, move,
rename, ...) files.

I dreamed a file manager - that is suitable for small window, and is as simple
as Dirvish, and has intuitive user interface like vimfiler!


------------------------------------------------------------------------------
1.3. Requirements                                        *vimfm-requirements*


Vimfm requires Vim (>= 8.0) to access full features. It may work in earlier
version, but not supported.

  Feature Used     Supported Version ~
  ---------------  ----------------- ~
  |win_getid()|      v7.4.1557
  |win_gotoid()|     v7.4.1557
  |win_findbuf()|    v7.4.1558


==============================================================================
2. Commands                                                  *vimfm-commands*


:Vimfm                                                              *:Vimfm*
  Open the current working directory with Vimfm.

:Vimfm {file}                                                     *:Vimfm_f*
  Open {file} with Vimfm. If {file} is not a directory, open its parent
  directory and focus the file.


==============================================================================
3. Key mappings                                          *vimfm-key-mappings*


------------------------------------------------------------------------------
3.1. Toggle selection                             *vimfm-key-mappings-toggle*


*<Plug>(vimfm-toggle-all)*
  Toggle selections of all items.

*<Plug>(vimfm-toggle-current)*
  Toggle selection of the item under the cursor.


------------------------------------------------------------------------------
3.2. Operations for the current item             *vimfm-key-mappings-current*


*<Plug>(vimfm-open-current)*
  Open the item under the cursor.

*<Plug>(vimfm-open-current-tab)*
  Open the item under the cursor in a new tab.


------------------------------------------------------------------------------
3.3. Operations for selections                *vimfm-key-mappings-selections*


*<Plug>(vimfm-delete-selected)*
  Delete selected items.
  Note: Vimfm uses builtin function |delete()| to delete files, so cannot undo
  the operation.

*<Plug>(vimfm-fill-cmdline)*
  Fill the command-line with a list of selected items. Useful for passing
  their paths to a shell command.

*<Plug>(vimfm-move-selected)*
  Move selected items to specified directory.

*<Plug>(vimfm-open-selected)*
  Open selected items.

*<Plug>(vimfm-open-selected-split)*
  Open selected items under the cursor with a split window.

*<Plug>(vimfm-open-selected-vsplit)*
  Open selected items under the cursor with a split window, it will be split
  vertically.

*<Plug>(vimfm-rename-selected)*
  Rename selected items.


------------------------------------------------------------------------------
3.4. Other operations                             *vimfm-key-mappings-others*


*<Plug>(vimfm-chdir-here)*
  Change the current working directory to one the current buffer has opened.

*<Plug>(vimfm-mkdir)*
  Create a new directory in the current directory.

*<Plug>(vimfm-new-file)*
  Create a new file in the current directory.

*<Plug>(vimfm-open-home)*
  Open home directory.

*<Plug>(vimfm-open-parent)*
  Open the parent directory.

*<Plug>(vimfm-open-root)*
  Open the root directory.

*<Plug>(vimfm-quit)*
  Quit Vimfm and close the buffer.

*<Plug>(vimfm-refresh)*
  Refresh the buffer.

*<Plug>(vimfm-toggle-hidden)*
  Toggle visibility of hidden (dot-prefixed) items.


------------------------------------------------------------------------------
3.5. Default key mappings                        *vimfm-default-key-mappings*


  Mode  {lhs}     {rhs} ~
  ----  --------  -------------------------------- ~
  n     ~         |<Plug>(vimfm-open-home)|
  n     h         |<Plug>(vimfm-open-parent)|
  n     l         |<Plug>(vimfm-open-current)|
  n     t         |<Plug>(vimfm-open-current-tab)|

  n     *         |<Plug>(vimfm-toggle-all)|
  n     .         |<Plug>(vimfm-toggle-hidden)|
  nv    <Space>   |<Plug>(vimfm-toggle-current)|

  n     <CR>      |<Plug>(vimfm-open-selected)|
  n     m         |<Plug>(vimfm-move-selected)|
  n     d         |<Plug>(vimfm-delete-selected)|
  n     r         |<Plug>(vimfm-rename-selected)|

  n     q         |<Plug>(vimfm-quit)|
  n     o         |<Plug>(vimfm-mkdir)|
  n     R         |<Plug>(vimfm-refresh)|
  n     i         |<Plug>(vimfm-new-file)|
  n     x         |<Plug>(vimfm-fill-cmdline)|


==============================================================================
4. Global options                                             *vimfm-options*


*g:vimfm_auto_cd*
  (Default: 0)
  If enabled, changes the working directory to selected one automatically.

*g:vimfm_force_delete*
  (Default: 0)
  Vimfm doesn't delete non-empty directory by default. This option will lift
  the restriction.

*g:vimfm_show_hidden_files*
  (Default: 0)
  If enabled, Vimfm shows hidden files by default. You can toggle the option
  with |<Plug>(vimfm-toggle-hidden)| any time.

*g:vimfm_open_selected_split_position*
  (Default: '')
  Possible values: '', 'topleft' or 'rightbelow'
  Set the position of the new window of |<Plug>(vimfm-open-selected-split)|.

*g:vimfm_open_selected_vsplit_position*
  (Default: '')
  Possible values: '', 'topleft' or 'rightbelow'
  Set the position of the new window of |<Plug>(vimfm-open-selected-vsplit)|.

*g:vimfm_use_default_mappings*
  (Default: 1)
  If disabled, Vimfm doesn't set up the default mappings. To customize key
  mappings, see |vimfm-example-custom-key-mappings|.

*g:vimfm_render_custom_icon*
  (Default: '')
  If you want to render custom file type icon for each item, specify
  the function name. See |vimfm-example-file-type-icons|.


==============================================================================
5. Examples                                                  *vimfm-examples*


Customizing key mappings:                 *vimfm-example-custom-key-mappings*
>
  function! s:customize_vimfm_mappings() abort
    " Customize key mappings here
    nmap <buffer> <Bslash> <Plug>(vimfm-open-root)
    nmap <buffer> K        <Plug>(vimfm-mkdir)
    nmap <buffer> N        <Plug>(vimfm-new-file)
  endfunction

  augroup vimrc_vimfm
    autocmd!
    autocmd FileType vimfm call s:customize_vimfm_mappings()
  augroup END
<
Adding file type icons:                       *vimfm-example-file-type-icons*
>
  " Install devicons (https://github.com/ryanoasis/vim-devicons)

  function! VimfmRenderCustomIcon(item)
    return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
  endfunction

  let g:vimfm_render_custom_icon = 'VimfmRenderCustomIcon'
<

==============================================================================
6. FAQ                                                            *vimfm-faq*


Q: I want to use Vimfm with NERDTree, but |:Vimfm| opens NERDTree buffer...
A: Try adding the following command to your vimrc:
>
  let NERDTreeHijackNetrw = 0
<
Q: How to prevent "Press ENTER or ..." message after every action?
A: Try adding the following command to your vimrc:
>
  set cmdheight=2
<

==============================================================================
7. About                                                        *vimfm-about*


Vimfm is developed by cocopon and licensed under the MIT License.
Visit the project page for the latest information:

  https://github.com/cocopon/vimfm.vim


==============================================================================
vim:ft=help:norl:ts=8:tw=78:
