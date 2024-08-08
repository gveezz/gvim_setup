" if version >= 700 && version < 800
"    let $VIMRUNTIME = $HOME."/.vim74/"
"    set runtimepath^=$VIMRUNTIME
"    set helpfile=$VIMRUNTIME/doc/help.txt
" elseif version >= 800 && version < 900
"    let $VIMRUNTIME = $HOME."/.vim82/"
"    set runtimepath^=$VIMRUNTIME
"    set helpfile=$VIMRUNTIME/doc/help.txt
" endif

" let g:popupBufferPattern = "Select %f (%n) from %p directory"

let mapleader = '\'

let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd='CtrlP :pwd'

let g:indentLine_enabled = 1
let g:indentLine_faster = 1

let g:netrw_mousemaps= 0
" hide netrw menu
let g:netrw_banner = 0
" tree listing
let g:netrw_liststyle = 0
" open files in new tab
let g:netrw_browse_split = 0
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"
let g:netrw_fastbrowse = 1
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1
let g:netrw_dirhistmax = 0
let g:netrw_winsize = 25
let g:netrw_preview   = 1

let g:AutoClosePairs = { '(': ')', '{': '}', '[': ']' }
let g:AutoCloseOn = 1

" if v:version < 700 || exists('loaded_bclose') || &cp
"     finish
" endif
" let loaded_bclose = 1
"
let b:did_indent = 1
let skip_defaults_vim=1

let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
" let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_gui = '#AAAAAA'
let g:indentLine_char_list = ['|']

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

helptags ~/.vim/doc
set nocompatible
colorscheme simozz
"set insertmode
set magic
set autochdir
set noshowmode
set viminfo=""
set incsearch
filetype plugin on
syntax enable
" set syntax=auto
set timeout timeoutlen=10 ttimeoutlen=1
" set updatetime=100
" set tags=tags;/
set noswapfile
set autoread
set autowrite
set clipboard=unnamed
set guioptions+=a
set guioptions-=m
set guioptions-=T
set guioptions+=a
set guioptions+=h
set guioptions+=b
set guioptions+=r
set guioptions+=e
" set guioptions=-l
set virtualedit=onemore
set whichwrap=<,>,[,],b,s
set selection=exclusive
set selectmode=mouse,key
set keymodel=startsel,stopsel
set softtabstop=0
set expandtab
set autoindent
set smartindent
set cindent
set copyindent
set tabstop=3
set shiftwidth=3
set indentexpr=
set smarttab
set number
" set relativenumber
set guifont=Monospace\ 11
set background=dark
set laststatus=2
set showcmd
" set statusline=%{GetMode()}\ %F\ %m\ %#StatusLine#%r%*\ BUFF#%n\ WIN#%{winnr()}\ (L:\ %l/%L\ \(%p%%),\ C:\ %c,\ BYTES:\ %o\)
set statusline=%f\ %y\ %m\ %#StatusLine#%r%*\ b#%n\ w#%{winnr()}\ (l:\ %l/%L\ %p,\ c:\ %c,\ v:%v)\ %{GetMode()}
set backspace=indent,eol,start
set guicursor=n:ver25-blinkon500-blinkoff500-nCursor,i-c:ver25-blinkoff0-iCursor,v:ver25-blinkoff0-vCursor
set noignorecase
set nocul
set formatoptions=tcj
set mouse=ar
set mousehide
" set mousefocus
set mouseshape=n:arrow,v:beam,i:beam
set mousemodel=popup
set lazyredraw
set scrolloff=0
set splitright
set splitbelow
set complete=.,k,t,i
set completeopt+=menuone,preview
set hidden
set hlsearch
set incsearch
set timeoutlen=0
syntax enable
" set wrapmargin=0
" set columns=80
" set linebreak
" set wrap
" set linebreak
" note trailing space at end of next line
" set columns=999
" set lines=51
" set history=1000
" set wc=<Tab>
" set wildmode=longest,list,full
" set wildmenu
" set wildoptions=tagfile
set tabline=%!MyTabLine()
set showtabline=2
set guitablabel=%{GuiTabLabel()}
" set splitbelow
" set splitright
" tab sball
" set guiheadroom=0
set equalalways
" set iskeyword+=10,33-47,92-95
set cursorline

set bufhidden=wipe
set switchbuf=useopen

set foldmethod=manual
set foldlevelstart=1

let g:bclose_multiple = 0
let g:searchString = ""

" CUSTOM FUNCTIONS
function! Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunction

function! ToLower()
    let cursor_pos = getpos(".")
    normal! viwu
    call setpos(".", cursor_pos)
endfunction

function! ToUpper()
    let cursor_pos = getpos(".")
    normal! viwU
    call setpos(".", cursor_pos)
endfunction

function! EchoYellowMsg(msg)
  echohl StatusLineY
  echo a:msg
  echohl None
endfunction

function! EchoWarnMsg(msg)
  echohl WarningMsg
  echo a:msg
  echohl None
endfunction

function! ProfileStart()
    :profile start profile.log
    :profile func *
    :profile file *
endfunction

function! ProfileStop()
    :profile pause
endfunction

function! s:Log(eventName) abort
  silent execute '!echo '.a:eventName.' >> log'
endfunction

function! PrintVimrcVersion()
	":normal ! echo "g:vimrcv".<CR>
	call EchoYellowMsg(g:vimrcv)
endfunction

" function! EnterWinBuffer()
"
"    if (&ft != 'help' && &ft != 'netrw' && &ft != 'nerdtree' && &buftype != 'terminal')
"        silent! lcd %:p:h | startinsert
"    else
" 	    silent! stopinsert
"    endif
"
" endfunction

"function! CtrlPExec()
"    stopinsert | CtrlP l:path
"endfunction

function! GuiTabLabel()
	  let label = ''
	  let bufnrlist = tabpagebuflist(v:lnum)

	  " Add '+' if one of the buffers in the tab page is modified
	  for bufnr in bufnrlist
	    if getbufvar(bufnr, "&modified")
	      let label = '+'
	      break
	    endif
	  endfor

	  " Append the number of windows in the tab page if more than one
	  let wincount = tabpagewinnr(v:lnum, '$')
	  if wincount > 1
	    let label .= 'w('.wincount.')'
	  endif
	  if label != ''
	    let label .= ' '
	  endif

	  " Append the buffer name
     let &guitabtooltip = fnamemodify(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]), ":p")
     return label . fnamemodify(bufname(bufnrlist[tabpagewinnr(v:lnum) - 1]),  ":t")
endfunction

function! MyTabLine()
	  let s = ''
	  for i in range(tabpagenr('$'))
	    " select the highlighting
	    if i + 1 == tabpagenr()
	      let s .= '%#TabLineSel#'
	    else
	      let s .= '%#TabLine#'
	    endif

	    " set the tab page number (for mouse clicks)
	    let s .= '%' . (i + 1) . 'T'

	    " the label is made by MyTabLabel()
	    let s .= ' %{MyTabLabel(' . (i + 1) . ')} |'
	  endfor

	  " after the last tab fill with TabLineFill and reset tab page nr
	  let s .= '%#TabLineFill#%T'

	  " right-align the label to close the current tab page
	  if tabpagenr('$') > 1
	    let s .= '%=%#TabLineFill#%999Xx'
	  endif

	  return s
endfunction

function! MyTabLabel(n)
   let buflist = tabpagebuflist(a:n)
   let winnr = tabpagewinnr(a:n)
   return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

function! TestTabBuflist()

   let tabn = tabpagenr()

   let buflist = tabpagebuflist(tabn)
   echom join(bufname(buflist))
   " let winnr = tabpagewinnr(tabn)
   " return bufname(buflist[winnr - 1])
endfunction

" indent file in one shot
function! Indent()

   let cursor_pos = getpos(".")
   " indent
   normal! gg=G
   "normal! =
   " return to cursor position
   call setpos(".", cursor_pos)
   " endif

endfunction

function! GuiSave() range

   if (&ft == 'nerdtree')
      call EchoYellowMsg("Hey dude, you're in nerdtree window...")
   else
     " :%s/\s*$//g
      if empty(bufname('%'))
         browse confirm write
      else
         :w!
      endif
      " :
   endif

   :IndentLinesReset

endfunction

function! AdjustFontSize(amount)

   let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
   let s:minfontsize = 6
   let s:maxfontsize = 16

   let fontname = substitute(&guifont, s:pattern, '\1', '')
   let cursize = substitute(&guifont, s:pattern, '\2', '')
   let newsize = cursize + a:amount
   if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
   let newfont = fontname . newsize
   let &guifont = newfont
   endif

endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction

" function! PopupBufferList2()
"    
"    let l:menuName = "BuffersList"
"    silent! exec ":aunmenu ".l:menuName
"    " All 'possible' buffers that may exist
"    let l:b_all = range(1, bufnr('$'))
"    " Unlisted ones
"    let l:b_unl = filter(l:b_all, '!buflisted(v:val)')
"    for l:nbuff in l:b_unl
"       let l:menuitem = substitute(bufname(l:nbuff), '\.', '\\.', 'g')
"       :exec ":amenu ]".l:menuName.".".l:menuitem." :b ".string(l:nbuff)."<CR>"
"    endfor
"    :exec ":popup ]".l:menuName
"    
" endfunction

function! JumpToTabWin(tabn, winn)
   silent! exec a:tabn."tabn"
   silent! exec "normal! ".a:winn."\<C-w>w"
endfunction

function! PopupBufferList()
   
   let l:menuName = "BList"
   silent! exec ":aunmenu ".l:menuName
   
   for l:t_idx in range(1, tabpagenr('$'))
      let l:buf_list = tabpagebuflist(l:t_idx)
      for l:idx in range(0, (len(l:buf_list)-1))
         " windows are numbered from 1 to winnr('$')
         let l:w_idx = l:idx+1
         let l:menuitem = substitute(fnamemodify(bufname(l:buf_list[l:idx]), ':p:t'), '\.', '\\.', 'g')
         let l:menuitem = substitute(l:menuitem, ' ', '_', 'g')
         if empty(l:menuitem)
            let l:menuitem = 'NoName'
         endif
         exec ":amenu ".l:menuName.".".l:menuitem." :call JumpToTabWin(".l:t_idx.",".l:w_idx.")<CR>"
      endfor
   endfor

   :exec ":popup ".l:menuName
   
endfunction

function! ClearBufferList()

   "let l:topline = line("w0")
   "let l:botline = line("w$")
   "let l:midline = float2nr((l:topline + l:botline)/2)
   "let l:cpos = getpos(".")
   "let l:cpos[1] = l:midline
   "call setpos(".", l:cpos)

   " All 'possible' buffers that may exist
   let b_all = range(1, bufnr('$'))
   " Unlisted ones
   let b_unl = filter(b_all, 'buflisted(v:val)')
   for nbuff in b_unl
      silent! :exec "bw! ".nbuff
   endfor

endfunction

function! BufferList()

   let l:b_all = range(1, bufnr('$'))

   " Unlisted ones
   let l:b_unl = filter(l:b_all, 'buflisted(v:val)')
   for l:nbuff in l:b_unl
      " let l:menuitem = bufname(nbuff)
      let l:menuitem = fnamemodify(bufname(nbuff), ':p:t')
      let l:menuitem = substitute(l:menuitem, ' ', '_', 'g')
      echohl StatusLineY
      echon "[".l:nbuff."] "
      echohl None
      echohl StatusLineW
      " echon l:menuitem."\t\t\t".fnamemodify(bufname(nbuff), ':p:h')
      echon fnamemodify(bufname(nbuff), ':p:h')."/"
      echohl None
      echohl StatusLineG
      echon l:menuitem."\n"
      echohl None
      " echohl StatusLineY
      " echon "[".l:nbuff."]\n"
      " echohl None

      " echom "[".l:nbuff."] ".l:menuitem
   endfor
   echohl None

   let l:cmd = input("Type a buffer cmd [d => delete]: ")
   if stridx(l:cmd, 'd') == 0
      exec ":b".l:cmd. " | :bnext"
   elseif stridx(l:cmd, '*') == 0
      exec ":%bwipeout!"
   else
      exec ":b ".l:cmd
   endif
endfunction

function! TabsList()
   :tabs
   let l:cmd = input("Type a tab #: ")
   silent! exec ":tabn ".l:cmd
endfunction

function! GetMode()
    let l:ms=mode()
    if l:ms == 'n'

	   ":hi StatusLine guifg=#B0B0FF
      return 'NORMAL  '

   elseif l:ms == 'i'

	   ":hi StatusLine guifg=#00ff00
      return 'INSERT  '

   elseif l:ms == 'v' || l:ms == 'V'

      ":hi StatusLine guifg=#AF8FFF
      return 'VISUAL  '

   elseif l:ms == 's' || l:ms == 'S'

      ":hi StatusLine guifg=#AF8FFF
      return 'SELECT  '

   elseif l:ms == 'R' || l:ms == 'Rv'
      
      return 'REPLACE '

   elseif l:ms == 't'

      ":hi StatusLine guifg=#41DF25
      return 'TERMINAL'

   elseif l:ms == 'c'

      ": hi StatusLine guifg=#FF9300
      return 'COMMAND '

   else
      return l:ms
   endif
endfunction

function! UpdateCursorLineMode()

   let l:mode = mode()

   if l:mode == 'i'
      set nohlsearch | hi Cursor guibg=#00ff00 | hi CursorLine guibg=#555555
   elseif l:mode == 'n'
      set hlsearch | hi Cursor guibg=#FFE800 | hi CursorLine guibg=#0000AA
   elseif l:mode == 'c'
      set hlsearch | hi Cursor guibg=#00ff00 | hi CursorLine guibg=#ffa556
   elseif l:mode == 'r'
      set hlsearch | hi Cursor guibg=#FFE800 | hi CursorLine guibg=#ff6356
   elseif l:mode == 'v' || l:mode == 'V' || l:mode == 's' || l:mode == 'S'
      set hlsearch | hi Cursor guibg=#FFE800 | hi CursorLine guibg=#a0a3ff
   else
      set hlsearch | hi Cursor guibg=#FFE800 | hi CursorLine guibg=#fffea0
   endif
   
endfunction

function! DeleteLineChars()
   normal! ^d$
endfunction

function! DeleteLine()
   normal! dd
endfunction

function! DeleteWord()

   " detect if we are
   " if len(getline('.')[col('.')-1:])
   "    normal! dw
   " elseif match(getline('.'), '^\s*$') != -1
   "    normal! b|dw
   " endif
   "
   if match(getline('.')[col('.')-1:], '^\s*$') != -1
      normal! b
   endif

   normal! dw

endfunction

" function! NerdTreeToggle()
" 
"    let l:winnr = winnr("$")
"    " if NERDTree is open
"    if (&ft == 'nerdtree')
"       " and it is not the only open window
"       if l:winnr > 1
"          " close NERDTree
"          silent! :NERDTreeClose
"       endif
"    else
"       " otherwise open it
"       if g:NERDTree.IsOpen() == 0
"          silent! :NERDTree
"       " else
"       "    silent! :NERDTreeClose
"       endif
"    endif
" endfunction

function! InComment()

   let l:incomment = stridx(synIDattr(synID(line('.'), col('.'), 0), 'name'), 'Comment')
   if l:incomment >= 0
      call EchoYellowMsg("In Comment ".l:incomment)
      return 1
   else
      call EchoYellowMsg("Not Comment ".l:incomment)
      return 0
   endif
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)

   if empty(a:buffer)
       let btarget = bufnr('%')
   elseif a:buffer =~ '^\d\+$'
       let btarget = bufnr(str2nr(a:buffer))
   else
       let btarget = bufnr(a:buffer)
   endif

   if btarget < 0
       call s:Warn('No matching buffer for '.a:buffer)
       return
   endif
   if empty(a:bang) && getbufvar(btarget, '&modified')
       "call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
       Bclose!
       return
   endif
   " Numbers of windows that view target buffer which we will delete.
   let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
   if !g:bclose_multiple && len(wnums) > 1
       call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
       return
   else
      " if the buffer is open only once, unload it completely from memory
      :bw!
   endif
   let wcurrent = winnr()
   for w in wnums
       execute w.'wincmd w'
       let prevbuf = bufnr('#')
       if prevbuf > 0 && buflisted(prevbuf) && prevbuf != w
           buffer #
       else
           bprevious
       endif
       if btarget == bufnr('%')
           " Numbers of listed buffers which are not the target to be deleted.
           let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
           " Listed, not target, and not displayed.
           let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
           " Take the first buffer, if any (could be more intelligent).
           let bjump = (bhidden + blisted + [-1])[0]
           if bjump > 0
               execute 'buffer '.bjump
           else
               execute 'enew'.a:bang
           endif
       endif
   endfor
   execute 'bdelete'.a:bang.' '.btarget
   execute wcurrent.'wincmd w'
endfunction

function! BetterBufferNext() abort

   for b in range(bufnr('%')+1, bufnr('$'))
      if buflisted(b) && bufwinnr(b)==-1
         exe "normal! :b".b."\<cr>"
         return
      endif
  endfor

  for b in range(1, bufnr('%')-1)
      if buflisted(b) && bufwinnr(b)==-1
         exe "normal! :b".b."\<cr>"
         return
      endif
  endfor

endfunction

function! BetterBufferPrev() abort

  for b in range(bufnr('%')-1, 1, -1)
    if buflisted(b) && bufwinnr(b)==-1
      exe "normal! :b".b."\<cr>"
      return
    endif
 endfor

  for b in range(bufnr('$'), bufnr('%')+1, -1)
    if buflisted(b) && bufwinnr(b)==-1
      exe "normal! :b".b."\<cr>"
      return
    endif
  endfor

endfunction

" function! Abbrev(match, replace)
"
"    let l:incomment = stridx(synIDattr(synID(line('.'), col('.'), 0), 'name'), 'Comment')
"    if l:incomment <= 0
"       return a:replace
"    else
"       return a:match
"
" endfunction

function! InComment()

   return (stridx(getline('.')[:col('.')-1], '//') >= 0)

endfunction

function! SnippetInComment(snippetToMatch)

   let l:snipN = len(split(getline('.'), a:snippetToMatch))
   return ((l:snipN > 0) && (InComment() >= 0))

endfunction

function! IabbrevSnippet()

   let l:snippetStr = "snippet"
   let l:snippetsStr = l:snippetStr."s"
   let l:ftSnipFile = $VIMHOME."/".l:snippetsStr."/".&ft.".".l:snippetsStr

   if filereadable(l:ftSnipFile) > 0
      " echom "Snippet file".l:ftSnipFile." found"
      " exec "setlocal dict+=".l:ftdictpath
      for l:line in readfile(l:ftSnipFile, '', 100)
         " echom "line = ".line
         if stridx(line, l:snippetStr) == 0
            let l:snippetToMatch = l:line[len(l:snippetStr)+1:]
            if len(l:snippetToMatch) > 0 && stridx(l:snippetToMatch, '#') < 0
               echom "l:snippetToMatch = ".l:snippetToMatch
               exec ":iabbrev <expr> <silent> <buffer> ".l:snippetToMatch." SnippetInComment('".l:snippetToMatch."') == 1 ? \"".l:snippetToMatch."\" : \"".l:snippetToMatch."<C-o>:call TriggerSnippet()<CR><c-r>=Eatchar(' ')<CR>\""
            endif
         endif
      endfor
   endif

endfunction

function! AddFtDict()

   let l:ftdictpath = $VIMHOME."/dictionary/".&ft.".txt"

   if filereadable(l:ftdictpath) > 0
      exec "setlocal dict+=".l:ftdictpath
   endif

endfunction

" function! CleverTab()
"
"    if pumvisible() == 0
"       if getline('.')[col('.') - 2] =~ '\w'
"          return "\<C-N>\<C-P>"
"       else
"          return "\<Tab>"
"       endif
"    else
"       return "\<C-N>"
"    endif
"
" endfunction

" function! PromptBufferOption()
"
"    echom "buffer x/c(lose)/n(ew)/o(pen): "
"    let l:char = getchar()
"    if l:char == 99 || l:char == 120
"       " c
"       exec ":silent! Bclose!"
"       if (winnr('$') > 2)
"          exec ":silent! :close!"
"       endif
"    elseif l:char == 110
"       " n
"       exec ":enew!"
"    elseif l:char == 111
"       " o
"       exec ":browse confirm e"
"    endif
"
" endfunction

function! FeedCompletePopUp()
   return "\<C-N>\<C-P>"
endfunction

function! AutoCompleteInoremap()

  let s:keysMappingDriven = [
        \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
        \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        \ '1', '2', '3', '4', '5', '6', '7', '8', '9', '//', '\\' , '_']
  for key in s:keysMappingDriven
    silent! execute "inoremap <expr> <silent> <nowait> ".key." pumvisible() == 0 ? \"".key."<c-r>=FeedCompletePopUp()<CR>\" : \"".key."\""
  endfor
endfunction

" function! GoToLine()
"
"    let l:col = col('.')
"    let l:line = input("Go to line: ")
"    if (stridx(l:line, '+') == 0) || (stridx(l:line, '-') == 0)
"       exec ":".l:line
"    else
"       call cursor(l:line, l:col)
"    endif
"
" endfunction

function! GoToLine()

   let l:line = line('.')
   let l:col = col('.')

   let l:idx = 0
   let l:strIn = ""
   let l:cInEnter = 13
   let l:cInEsc = 27
   let l:cIn = 0
   echon "Line: ".l:strIn

   while l:cIn != l:cInEnter
      let l:cIn = getchar()
      let l:cInCh = nr2char(l:cIn)

      " if char2nr(l:cIn) >= char2nr('0') && char2nr(l:cIn) <= char2nr('9')
      if l:cIn =~# '\d'
         let l:strIn = l:strIn.l:cInCh
         let l:idx = l:idx + 1
      elseif l:cIn == "\<Backspace>"
         if l:idx > 0
            let l:idx = l:idx - 1
            let l:strIn = strpart(l:strIn, 0, l:idx)
         else
            let l:idx = 0
            let l:strIn = ""
         endif
      endif

      if l:cIn != l:cInEsc
         if strlen(l:strIn) > 0
            call cursor(str2nr(l:strIn), l:col)
         else
            call cursor(1, l:col)
         endif

         redraw!
         echon "Line: ".l:strIn
      else
         let l:cIn = l:cInEnter
         call cursor(l:line, l:col)
      endif
   endwhile
   
endfunction

" function! GoToLineCol()
"
"    let l:cLine = line('.')
"    let l:cCol = col('.')
"    let l:nLine = l:cLine
"    let l:nCol = l:cCol
"
"    call inputrestore()
"    let l:inStr = input("Go to [l (.),c]: ")
"    call inputsave()
"
"    if len(l:inStr) == 0
"       return
"    endif
"
"    let l:splitStr = split(l:inStr, ",")
"    let l:lineStr = l:splitStr[0]
"    let l:colStr = l:cCol
"    if len(l:splitStr) > 1
"       let l:colStr = l:splitStr[1]
"    endif
"
"    "echom "splitStr: ".join(l:splitStr) | sleep
"    "echom "len splitStr: ".len(l:splitStr) | sleep
"    "echom "Line: ".l:splitStr[0]." - Col: ".l:splitStr[1] | sleep
"
"    let l:nLine = l:cLine
"    let l:nCol = l:cCol
"
"    if stridx(l:lineStr, '+') == 0
"       let l:nLine = l:cLine + l:lineStr[1:]
"    elseif stridx(l:lineStr, '-') == 0
"       let l:nLine = l:cLine - l:lineStr[1:]
"    elseif l:lineStr == '.'
"       let l:nLine = l:cLine
"    else
"       let l:nLine = l:lineStr
"    endif
"
"    if stridx(l:colStr, '+') == 0
"       let l:nCol = l:cCol + l:colStr[1:]
"    elseif stridx(l:colStr, '-') == 0
"       let l:nCol = l:cCol - l:colStr[1:]
"    elseif l:nCol == '.'
"       let l:nCol = l:cCol
"    elseif l:nCol == '$'
"       let l:nCol = col('$')
"    else
"       let l:nCol = l:colStr
"    endif
"
"    call cursor(l:nLine, l:nCol)
" endfunction

" function! GoToCol()
"
"    let l:line = line('.')
"    let l:col = input("Go to column: ")
"    call cursor(l:line, l:col)
"
" endfunction

" function! PromptHelp()
"
"    let l:helpstr = input("Help: ")
"    if len(l:helpstr) != 0
"       exec ":h ".l:helpstr
"    endif
"
" endfunction

function! PromptFindI()
   :promptfind
endfunction

function! PromptReplI()
   :promptrepl
endfunction

" pending interactive implementation
" function! PromptFindI()
"
"    call inputrestore()
"    let l:sword = input("[F] Find: ")
"    call inputsave()
"    echom l:sword
"    silent! call search(l:sword, 'w')
"
" endfunction

function! TestGetChar()
   let l:c = 0
   let l:cInEsc = 27
   let l:cIn = 0
   while l:cIn != l:cInEsc
      let l:cIn = getchar()
      echom "l:cIn = ".l:cIn." = nr2char(".l:cIn.") = ". nr2char(l:cIn)
   endwhile
endfunction

function! PromptFindI()

   let l:line = line('.')
   let l:col = col('.')
   let l:idx = 0
   let l:strIn = ""
   let l:cInEnter = 13
   let l:cInEsc = 27
   let l:cInCtrlV = 22
   let l:cIn = 0

   echon "[F] Find: "
   " set hlsearch
   while l:cIn != l:cInEnter

      let l:cIn = getchar()
      let l:cInCh = nr2char(l:cIn)

      " if char2nr(l:cIn) >= char2nr('0') && char2nr(l:cIn) <= char2nr('9')
      if l:cIn == "\<Backspace>"
         if l:idx > 0
            let l:idx = l:idx - 1
            let l:strIn = strpart(l:strIn, 0, l:idx)
         else
            let l:idx = 0
            let l:strIn = ""
         endif
      elseif l:cIn == l:cInCtrlV
         let l:strIn = l:strIn.@*
         let l:idx = l:idx + strlen(@*)
      else
         let l:strIn = l:strIn.l:cInCh
         let l:idx = l:idx + 1
      endif

      if l:cIn != l:cInEsc

         if strlen(l:strIn) > 0
            call search(l:strIn, 'wcz')
            silent! exec ":match Search /".l:strIn."/"
         endif

         redraw!
         echon "[F] Find: ".l:strIn

      else
         silent! exec ":match Search //"
         let l:cIn = l:cInEnter
         call cursor(l:line, l:col)
         redraw!
      endif
   endwhile
   " set nohlsearch
endfunction

" pending interactive implementation
function! PromptReplExctI()
   call inputrestore()
   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:sword = input("[F/R exct] Find: ")
   let l:rword = input("[F/R exct] Repl: ")
   call inputsave()
   if len(l:rword) > 0
      silent! exec ":%s/\\<".l:sword."\\>/".l:rword."/g"
   endif
   call cursor(l:cLine, l:cCol)
endfunction

" pending interactive implementation
function! PromptReplI()
   call inputrestore()
   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:sword = input("[F/R] Find: ")
   let l:rword = input("[F/R] Repl: ")
   call inputsave()
   if len(l:rword) > 0
      silent! exec ":%s/".l:sword."/".l:rword."/g"
   endif
   call cursor(l:cLine, l:cCol)
endfunction

" pending interactive implementation
function! PromptFindS()
   let l:sword = @*
   echom "[F] Find: ".l:sword
   call search(l:sword, 'wcz')
endfunction

function! PromptReplExctS()
   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:sword = @*
   echom "[F/R] Find: ".l:sword
   call inputrestore()
   let l:rword = input("[F/R exct] Repl: ")
   call inputsave()
   if len(l:rword) > 0
      silent! exec ":%s/\\<".l:sword."\\>/".l:rword."/g"
   endif
   call cursor(l:cLine, l:cCol)
endfunction

function! PromptReplS()
   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:sword = @*
   echom "[F/R] Find: ".l:sword
   call inputrestore()
   let l:rword = input("[F/R] Repl: ")
   call inputsave()
   if len(l:rword) > 0
      silent! exec ":%s/".l:sword."/".l:rword."/g"
   endif
   call cursor(l:cLine, l:cCol)
endfunction

function! ExecCmd()

   let l:cmd = input(":")
   exec ":".l:cmd

endfunction

function! RePage()

   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:winheight = winheight('.')
   let l:firstvline = line('w0')
   let l:bfirstline = 1

   if (l:firstvline - l:bfirstline) >= l:winheight
      call cursor(l:cLine - l:winheight, l:cCol)
      silent! z.
   else
      let l:linejmp = (line('.') - l:bfirstline)
      call cursor(l:cLine - l:linejmp, l:cCol)
   endif

endfunction

function! AvPage()

   let l:cLine = line('.')
   let l:cCol = col('.')
   let l:winheight = winheight('.')
   let l:lastvline = line('w$')
   let l:blastline = line('$')

   if (l:blastline - l:lastvline) >= l:winheight
      call cursor(l:cLine + l:winheight, l:cCol)
      silent! z.
   else
      call cursor(l:blastline, l:cCol)
   endif

endfunction

function! GotoTab()
   $tabmove
   let bufnr = tabpagebuflist()[0]
   let tabnr = tabpagenr()
   for tabindex in range(1, tabpagenr('$'))
      if tabnr == tabindex
         continue
      endif
      let bufnrs = tabpagebuflist(tabindex)
      let bufindex = index(bufnrs, bufnr)
      if bufindex >= 0
         execute "tabn" .. tabindex
         execute "tabclose" .. tabnr
         break
      endif
   endfor
endfunction

function! GoToFirstWin()

   exec "normal! 1\<C-w>w"

endfunction

function! GoToLastWin()

   let l:lastWin = winnr('$')
   silent! exec "normal! ".l:lastWin."\<C-w>w"

endfunction

function! GoToPrevWin()

   let l:currWin = winnr()
   if l:currWin > 1
      let l:prevWin = l:currWin-1
      exec "normal! ".l:prevWin."\<C-w>w"
   endif

endfunction

function! GoToNextWin()

   let l:currWin = winnr()
   let l:nextWin = l:currWin
   if l:currWin < winnr('$')
      let l:nextWin = l:currWin+1
      silent! exec "normal! ".l:nextWin."\<C-w>w"
   end

endfunction

function! GoToWin()

   let l:win = input("Go to win #")
   silent! exec "normal! ".l:win."\<C-w>w"

endfunction

function! IsBlank( bufnr )
    return (empty(bufname(a:bufnr)) &&
    \ getbufvar(a:bufnr, '&modified') == 0 &&
    \ empty(getbufvar(a:bufnr, '&buftype'))
    \)
endfunction

function! ExistOtherBuffers( targetBufNr )
    return ! empty(filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != a:targetBufNr'))
endfunction

function! IsEmptyVim()
    let l:currentBufNr = bufnr('')
    return IsBlank(l:currentBufNr) && ! ExistOtherBuffers(l:currentBufNr)
endfunction

function! IsEmptyBuffer()
   if (line('$') == 1 && getline('.') == '') || wordcount()['words'] == 0
      return 1
   else
      return 0
   endif
endfunction

function! CloseBuffer()

   if tabpagenr('$') > 1 || winnr('$') > 1
      if IsEmptyBuffer() == 1
         silent! :bw!
      else
         silent! :close!
      endif
   else
      if IsEmptyBuffer()
         call EchoWarnMsg('Last win empty buffer, q to quit')
         if nr2char(getchar()) == 'q'
            silent! :q
         endif
      else 
         silent! :bw!
      endif
   endif
   
endfunction

" function! CloseBuffer()
"    
"    let l:b_name = bufname()
"    let l:w_num = winnr('$')
"    let l:t_num = tabpagenr('$')
"    let l:b_count = 0
"    let l:btot = 0
" 
"    if IsEmptyVim()
"       call EchoWarnMsg('Last win empty buffer, q to quit')
"       if nr2char(getchar()) == 'q'
"          silent! :q
"       endif
"    else
"       for l:t_idx in range(1, l:t_num)
"          let l:buf_list = tabpagebuflist(l:t_idx)
"          for l:b_i in range(0, (len(l:buf_list)-1))
"             if bufname(l:buf_list[l:b_i]) == l:b_name
"                let l:b_count = l:b_count + 1
"             endif
" 
"             let l:btot = l:btot + 1
"          endfor
"       endfor
"    endif
" 
"    " if we have a duplicated buffer,
"    " just close the window
"    if l:btot == 1
"       call EchoWarnMsg('Last win empty buffer, q to quit')
"       if nr2char(getchar()) == 'q'
"          silent! :q
"       endif
"    else 
"       if l:b_count > 1
"          if &ft == 'netrw' || (line('.') == 1 && getline('.') == '')
"             silent! :bw!
"             silent! :close!
"          else
"             " echo "Duplicated buffer"
"             silent! :close!
"          endif
"       else
"          silent! :bw!
"          " if l:t_num > 1 || l:w_num > 1
"          "    " echo "l:t_num > 1 || l:w_num > 1"
"          "    silent! :close!
"          " elseif l:w_num == 1
"          "    " echo "l:w_num == 1"
"          "    silent! :bw!
"          " endif
"       endif
"    endif
" 
"    call DeleteHiddenBuffers()
" 
"    " if l:t_num || (l:b_count > 1 && l:w_num > 1)
"    "    " just close the window of the duplicated buffer
"    "    silent! :close
"    " else 
"    "    silent! :bw!
"    " endif
" 
" endfunction

function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute ':bw!' buf
    endfor
endfunction

function! HighlightSearch(timer)
    if (g:firstCall)
        let g:originalStatusLineHLGroup = execute("hi StatusLine")
        let g:firstCall = 0
    endif
    if (exists("g:searching") && g:searching)
        let searchString = getcmdline()
        if searchString == "" 
            let searchString = "."
        endif
        let newBG = search(searchString) != 0 ? "green" : "red"
        if searchString == "."
            set whichwrap+=h
            normal h
            set whichwrap-=h
        endif
        execute("hi StatusLine ctermfg=" . newBG)
        let g:highlightTimer = timer_start(50, 'HighlightSearch')
        let g:searchString = searchString
    else
        let originalBG = matchstr(g:originalStatusLineHLGroup, 'ctermfg=\zs[^ ]\+')
        execute("hi StatusLine ctermfg=" . originalBG)
        if exists("g:highlightTimer")
            call timer_stop(g:highlightTimer)
            call HighlightCursorMatch()
        endif
    endif
endfunction

function! HighlightCursorMatch() 
    try
        let l:patt = '\%#'
        if &ic | let l:patt = '\c' . l:patt | endif
        exec 'match IncSearch /' . l:patt . g:searchString . '/'
    endtry
endfunction

function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'HighCW' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

map <silent> <nowait> <Leader>t :TableModeEnable<CR>

inoremap <silent> <nowait> <C-ScrollWheelUp> <C-o>:call LargerFont()<CR>
" inoremap <silent> <nowait> <C-RightRelease> <C-o>:call LargerFont()<CR>
inoremap <silent> <nowait> <C-ScrollWheelDown> <C-o>:call SmallerFont()<CR>
" inoremap <silent> <nowait> <C-LeftRelease> <C-o>:call SmallerFont()<CR>
nnoremap <silent> <nowait> <C-ScrollWheelUp> :call LargerFont() <CR>
" nnoremap <silent> <nowait> <C-RightRelease> :call LargerFont()<CR>
nnoremap <silent> <nowait> <C-ScrollWheelDown> :call SmallerFont()<CR>
" nnoremap <silent> <nowait> <C-LeftRelease> :call SmallerFont()<CR>

" Scroll bar right
inoremap <silent> <nowait> <M-PageUp> <C-o>10zh
nnoremap <silent> <nowait> <M-PageUp> 10zh
xnoremap <silent> <nowait> <M-PageUp> 10zh
inoremap <silent> <nowait> <C-M-ScrollWheelUp> <C-o>10zh
nnoremap <silent> <nowait> <C-M-ScrollWheelUp> 10zh
snoremap <silent> <nowait> <C-M-ScrollWheelUp> <C-o>10zh

" Scroll bar left
inoremap <silent> <nowait> <M-PageDown> <C-o>10zl
nnoremap <silent> <nowait> <M-PageDown> 10zl
xnoremap <silent> <nowait> <M-PageDown> 10zl
inoremap <silent> <nowait> <C-M-ScrollWheelDown> <C-o>10zl
nnoremap <silent> <nowait> <C-M-ScrollWheelDown> 10zl
snoremap <silent> <nowait> <C-M-ScrollWheelDown> <C-o>10zl

" C-o: goes to normal mode if insert mode. This makes less likely
" to accidentally jump from insert and normal mode
inoremap <silent> <nowait> <C-o> <Esc>l
nnoremap <silent> <nowait> <C-o> <nop>

" Esc: return to normal mode if insert mode, or viceversa
inoremap <silent> <nowait> <C-.> <C-o>

inoremap <silent> <nowait> <Esc> <C-o><Esc>
nnoremap <silent> <nowait> <Esc> i

inoremap <silent> <nowait> <C-w> <C-o><C-w>

" C-b:
inoremap <nowait> <C-b> <C-o>:b 
noremap <nowait> <C-b> :b 
" M-n: go to normal mode from insert mode
" inoremap <silent> <nowait> <M-n> <Esc>

" " C-d: open netrw in a vertical split
" inoremap <expr> <silent> <nowait> <C-d> line('$') == 1 && getline('.') == '' ? "<C-o>:Explore!<CR><C-w>L" : "<C-o>:Vexplore!<CR><C-w>L"
" nnoremap <expr> <silent> <nowait> <C-d> line('$') == 1 && getline('.') == '' ? ":Explore!<CR><C-w>L" : ":Vexplore!<CR><C-w>L" 
" vnoremap <expr> <silent> <nowait> <C-d> line('$') == 1 && getline('.') == '' ? "<Esc><C-o>:Explore!<CR><C-w>L" : "<Esc><C-o>:Vexplore!<CR><C-w>L"
" snoremap <expr> <silent> <nowait> <C-d> line('$') == 1 && getline('.') == '' ? "<Esc><C-o>:Explore!<CR><C-w>L" : "<Esc><C-o>:Vexplore!<CR><C-w>L"
" cnoremap <silent> <nowait> <C-d> <C-c>

" C-d: open netrw in a new tab 
inoremap <silent> <nowait> <C-d> <C-o>:Explore!<CR>
nnoremap <silent> <nowait> <C-d> :Explore!<CR>
vnoremap <silent> <nowait> <C-d> <Esc><C-o>:Explore!<CR>
snoremap <silent> <nowait> <C-d> <Esc><C-o>:Explore!<CR>
cnoremap <silent> <nowait> <C-d> <C-c>

" F1-F12 mappings
inoremap <silent> <nowait> <F2> <C-o>:call LargerFont()<CR>
nnoremap <silent> <nowait> <F2> :call LargerFont()<CR>

" F3: switch to next window
inoremap <silent> <nowait> <F3> <C-o>:call SmallerFont()<CR>
nnoremap <silent> <nowait> <F3> :call SmallerFont()<CR>

" F4: open file to diff side by side
inoremap <silent> <nowait> <F4> <C-o>:browse confirm vert diffsplit<CR>
nnoremap <silent> <nowait> <F4> <C-o>:browse confirm vert diffsplit<CR>

" S-F4: diffoff
inoremap <silent> <nowait> <S-F4> <C-o>:diffoff<CR>
nnoremap <silent> <nowait> <S-F4> <C-o>:diffoff<CR>

" F5: increase vertical resize by 5 units
inoremap <silent> <nowait> <F5> <C-o>:vertical resize +5<CR>
nnoremap <silent> <nowait> <F5> :vertical resize +5<CR>

" S-F5: descrease vertical resize by 5 units
inoremap <silent> <nowait> <S-F5> <C-o>:vertical resize -5<CR>
nnoremap <silent> <nowait> <S-F5> :vertical resize -5<CR>

" F6: Turn off hlsearch highlight
inoremap <silent> <nowait> <F6> <C-o>:set nohlsearch<CR>
nnoremap <silent> <nowait> <F6> :set nohlsearch<CR>

" F7 to F9 <nop>
inoremap <silent> <nowait> <F7> <nop>
nnoremap <silent> <nowait> <F7> <nop>
inoremap <silent> <nowait> <F8> <nop>
nnoremap <silent> <nowait> <F8> <nop>
inoremap <silent> <nowait> <F9> <nop>
inoremap <silent> <nowait> <F9> <nop>
nnoremap <silent> <nowait> <F9> <nop>
inoremap <silent> <nowait> <F10> <nop>
nnoremap <silent> <nowait> <F10> <nop>
inoremap <silent> <nowait> <F12> <nop>
nnoremap <silent> <nowait> <F12> <nop>
vnoremap <silent> <nowait> <F7> <Esc>
vnoremap <silent> <nowait> <F8> <Esc>
vnoremap <silent> <nowait> <F9> <Esc>
vnoremap <silent> <nowait> <F9> <Esc>
"vnoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<Esc>:set columns=999<CR>" : "<Esc>:set columns=100<CR>"
vnoremap <silent> <nowait> <F12> <nop>
snoremap <silent> <nowait> <F7> <Esc>
snoremap <silent> <nowait> <F8> <Esc>
snoremap <silent> <nowait> <F9> <Esc>
snoremap <silent> <nowait> <F9> <Esc>
" snoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<Esc>:set columns=999<CR>" : "<Esc>:set columns=100<CR>"
snoremap <silent> <nowait> <F12> <nop>

" F11: toggle full screen
inoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<C-o>:set columns=999<CR>" : "<C-o>:set columns=100<CR>"
nnoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<C-o>:set columns=999<CR>" : "<C-o>:set columns=100<CR>"

" <Home>: jump before the first non-blank of the current line
inoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "<C-o>^" : "<C-o>0"
nnoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "^" : "0"
vnoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "^" : "0"
snoremap <expr> <silent> <nowait> <S-Home> getline('.')[:col('.')-2] =~ '\w' ? "<C-o>^" : "<C-o>0"

" C-c: command line mode
inoremap <nowait> <M-x> <C-o>:
nnoremap <nowait> <M-x> :
vnoremap <nowait> <M-x> <Esc><C-c>:

inoremap <silent> <nowait> <C-LeftMouse> <nop>
inoremap <silent> <nowait> <C-RightMouse> <nop>
nnoremap <silent> <nowait> <C-LeftMouse> <nop>
nnoremap <silent> <nowait> <C-RightMouse> <nop>

" S-Del
inoremap <silent> <nowait> <S-Del> <nop>
cnoremap <silent> <nowait> <S-Del> <nop>

" Enter: trigger snippet completitio if pumvisible, Enter otherwise
" inoremap <expr> <silent> <nowait> <Enter> pumvisible() != 0 ? "<C-y><c-r>=TriggerSnippet()<CR>" : "<Enter>"
" Enter: trigger snippet completitio if pumvisible, Enter otherwise
inoremap <expr> <silent> <nowait> <Enter> ((pumvisible() != 0) && (InComment() == 0)) ? "<C-y><c-r>=TriggerSnippet()<CR>" : "<Enter>"
" Enter: add new line in normal mode
" nnoremap <silent> <nowait> <CR> i<Enter><Esc>

" Backspace: behave as in normal mode
" nnoremap <expr> <silent> <nowait> <Backspace> col('.') == 1 ? "k$<Right>" : "dh"

" Tab: advance completition selection if pumvisible, Tab otherwise
inoremap <expr> <silent> <nowait> <Tab> pumvisible() != 0 ? "<C-N>" : "<Tab>"

" S-Tab: de-advance completition selection if pumvisible, inverse Tab otherwise
inoremap <expr> <silent> <nowait> <S-Tab> pumvisible() != 0 ? "<C-p>" : "<C-d>"

" M-l: show tab files list
" inoremap <silent> <nowait> <M-l> <C-o>:call TabsList()<CR>
" nnoremap <silent> <nowait> <M-l> :call TabsList()<CR>

inoremap <silent> <nowait> <C-ç> <C-o>*
nnoremap <silent> <nowait> <C-ç> *

inoremap <silent> <nowait> <C-´> <C-o>#
nnoremap <silent> <nowait> <C-´> #

" C-n: find next occurrence of previous search
"inoremap <silent> <nowait> <C-n> <C-o>*
"nnoremap <silent> <nowait> <C-n> *

"nnoremap <silent> <nowait> n n:call HighlightCursorMatch()<CR>
"nnoremap <silent> <nowait> N N:call HighlightCursorMatch()<CR>

" C-l: pop up buffer list
"inoremap <silent> <nowait> <C-l> <C-o>:call quickui#tools#list_buffer('tabedit')<CR>
"nnoremap <silent> <nowait> <C-l> :call quickui#tools#list_buffer('tabedit')<CR>
"vnoremap <silent> <nowait> <C-l> <Esc>:call quickui#tools#list_buffer('tabedit')<CR>

" inoremap <nowait> <C-M-l> <C-o>:call BufferList()<CR>
" nnoremap <nowait> <C-M-l> :call BufferList()<CR>
" vnoremap <nowait> <C-M-l> <C-o>:call BufferList()<CR>
" snoremap <nowait> <C-M-l> <C-o>:call BufferList()<CR>

" C-p: CtrlP
inoremap <nowait> <C-p> <Esc>:CtrlP .<CR>
nnoremap <nowait> <C-p> :CtrlP .<CR>
vnoremap <nowait> <C-p> <Esc>:CtrlP .<CR>

" C-f: prompt find
inoremap <nowait> <C-f> <Esc>/
nnoremap <nowait> <C-f> /
vnoremap <nowait> <C-f> <Esc><C-c>/<C-r>*/<CR>
cnoremap <silent> <nowait> <C-f> <C-c>

inoremap <nowait> <C-S-f> <Esc>?
nnoremap <nowait> <C-S-f> ?

" C-l: prompt replace
inoremap <nowait> <C-l> <C-o>:call BufferList()<CR>
nnoremap <nowait> <C-l> :call BufferList()<CR>
snoremap <nowait> <C-l> <C-o>:call BufferList()<CR>
cnoremap <silent> <nowait> <C-r> <C-c>

" C-r: prompt replace
inoremap <nowait> <C-r> <C-o>:call PromptReplI()<CR>
nnoremap <nowait> <C-r> :call PromptReplI()<CR>
snoremap <nowait> <C-r> <C-o>:call PromptReplS()<CR>
cnoremap <silent> <nowait> <C-r> <C-c>

" M-r: prompt replace exact match
" inoremap <silent> <nowait> <M-r> <C-o>:call PromptReplExctI()<CR>
" snoremap <silent> <nowait> <M-r> <C-o>:call PromptReplExctS()<CR>

" C-s: save
inoremap <silent> <nowait> <C-s> <C-o>:call GuiSave()<CR>
nnoremap <silent> <nowait> <C-s> :call GuiSave()<CR>
cnoremap <silent> <nowait> <C-s> <C-c><C-o>:call GuiSave()<CR>
xnoremap <silent> <nowait> <C-s> <Esc>:call GuiSave()<CR>

" C-k: delete line
inoremap <silent> <nowait> <C-k> <C-o>dd
nnoremap <silent> <nowait> <C-k> dd
vnoremap <silent> <nowait> <C-k> dl

" C-g: go to line and column
inoremap <silent> <nowait> <C-g> <C-o>:call GoToLine()<CR>
nnoremap <silent> <nowait> <C-g> :call GoToLine()<CR>

" C-z: undo changes
inoremap <silent> <nowait> <C-z> <C-o>:undo<CR>
nnoremap <silent> <nowait> <C-z> :undo<CR>
snoremap <silent> <nowait> <C-z> <Esc><C-c>:undo<CR>
vnoremap <silent> <nowait> <C-z> <Esc><C-c>:undo<CR>

" C-y: redo changes
inoremap <silent> <nowait> <C-y> <C-o>:redo<CR>
nnoremap <silent> <nowait> <C-y> :redo<CR>
xnoremap <silent> <nowait> <C-z> <Esc>:redo<CR>

" C-v: Paste
inoremap <silent> <nowait> <C-v> <C-r><C-o>+
nnoremap <silent> <nowait> <C-v> <C-r><C-o>+
xnoremap <silent> <nowait> <C-v> <C-r><C-o>+
snoremap <silent> <nowait> <C-v> <C-r><C-o>+
cnoremap <nowait> <C-v> <C-r>+

" MiddleMouse: paste as well
" inoremap <silent> <nowait> <MiddleMouse> <C-o>"+P
" nnoremap <silent> <nowait> <MiddleMouse> "+P
" xnoremap <silent> <nowait> <MiddleMouse> <nop>
inoremap <silent> <nowait> <MiddleMouse> <nop>
nnoremap <silent> <nowait> <MiddleMouse> <nop>
vnoremap <silent> <nowait> <MiddleMouse> <nop>

" M-v: block paste
inoremap <silent> <nowait> <M-v> <C-r><C-o>+

" C-Space: start visual block mode
" <LeftMouse><LeftMouse>
inoremap <silent> <nowait> <C-Space> <C-o>viw
nnoremap <silent> <nowait> <C-Space> i
xnoremap <expr> <silent> <nowait> <C-Space> mode() == "v" ? "V" : mode() =="V" ? "b<Esc>" : "v"


" C-a: select all
inoremap <silent> <nowait> <C-a> <Esc>ggVG
nnoremap <silent> <nowait> <C-a> ggVG

" M-Up: switch to the upper window
inoremap <silent> <nowait> <M-Up> <C-o><C-w><Up>
nnoremap <silent> <nowait> <M-Up> <C-w><Up>
xnoremap <silent> <nowait> <M-Up> <Esc><C-w><Up>

" " M-Left: switch to the upper window
inoremap <silent> <nowait> <M-Left> <C-o><C-w><Left>
nnoremap <silent> <nowait> <M-Left> <C-w><Left>
xnoremap <silent> <nowait> <M-Left> <Esc><C-w><Left>

inoremap <silent> <nowait> <M-Right> <C-o><C-w><Right>
nnoremap <silent> <nowait> <M-Right> <C-w><Right>
xnoremap <silent> <nowait> <M-Right> <Esc><C-w><Right>

" M-Down
inoremap <silent> <nowait> <M-Down> <C-o><C-w><Down>
nnoremap <silent> <nowait> <M-Down> <C-w><Down>
xnoremap <silent> <nowait> <M-Down> <Esc><C-w><Down>

" M-v
inoremap <silent> <nowait> <C-n> <C-o>:vnew<CR>
nnoremap <silent> <nowait> <C-n> :vnew<CR>
xnoremap <silent> <nowait> <C-n> <Esc><C-o>:vnew<CR>

" M-s
inoremap <silent> <nowait> <C-M-n> <C-o>:new<CR>
nnoremap <silent> <nowait> <C-M-n> :new<CR>
xnoremap <silent> <nowait> <C-M-n> <Esc><C-o>:new<CR>

" C-PageUp: switch to next window or tab
" inoremap <silent> <nowait> <C-PageUp> winnr() > 1 ? "<C-o>:call GoToPrevWin()<CR>" : "<C-o>:tabprev<CR>"
" nnoremap <silent> <nowait> <C-PageUp> winnr() > 1 ? ":call GoToPrevWin()<CR>" : ":tabprev<CR>"
" xnoremap <silent> <nowait> <C-PageUp> winnr() > 1 ? "<Esc>:call GoToPrevWin()<CR>" : "<Esc>:tabprev<CR>"
cnoremap <silent> <nowait> <C-PageUp> <C-c>

" C-PageDown: switch to previous window or tab
" inoremap <expr> <silent> <nowait> <C-PageDown> winnr() < winnr('$') ? "<C-o>:call GoToNextWin()<CR>" : "<C-o>:tabnext<CR>"
" nnoremap <expr> <silent> <nowait> <C-PageDown> winnr() < winnr('$') ? ":call GoToNextWin()<CR>" : ":tabnext<CR>"
" nnoremap <expr> <silent> <nowait> <C-PageDown> winnr() < winnr('$') ? "<Esc>:call GoToNextWin()<CR>" : "<Esc>:tabnext<CR>"
cnoremap <silent> <nowait> <C-PageDown> <C-c>

" inoremap <silent> <nowait> <M-w> <C-o>:call GoToWin()<CR>
" nnoremap <silent> <nowait> <M-w> :call GoToWin()<CR>
" vnoremap <silent> <nowait> <M-w> <C-o>:call GoToWin()<CR>
" cnoremap <silent> <nowait> <M-w> <C-c>

" M-o: open pop up window to open a file (or create one)
inoremap <silent> <nowait> <M-o> <C-o>:browse confirm e<CR>
nnoremap <silent> <nowait> <M-o> :browse confirm e<CR>

" Better advance or reverse page
inoremap <silent> <nowait> <PageDown> <C-o>:call AvPage()<CR>
nnoremap <silent> <nowait> <PageDown> :call AvPage()<CR>
inoremap <silent> <nowait> <PageUp> <C-o>:call RePage()<CR>
nnoremap <silent> <nowait> <PageUp> :call RePage()<CR>

" C-Right: forward word movement
inoremap <expr> <silent> <nowait> <C-Right> getline('.')[col('.')-1] == ' ' ? "<C-o>w" : "<C-o>e<Right>"
nnoremap <expr> <silent> <nowait> <C-Right> getline('.')[col('.')-1] == ' ' ? "w" : "e<Right>"
" C-Left: Backward word movement
inoremap <expr> <silent> <nowait> <C-Left> getline('.')[col('.')-2] == ' ' ? "<C-o>ge<Right>" : "<C-o>b"
nnoremap <expr> <silent> <nowait> <C-Left> getline('.')[col('.')-2] == ' ' ? "ge<Right>" : "b"

" C-x: close current buffer
" inoremap <expr> <silent> <nowait> <C-x> tabpagenr('$') > 1 ? winnr('$') > 1 ? "<C-o>:bw! <CR>" : "<C-o>:tabclose!<CR>" : "<Esc>:call EchoWarnMsg('Last window, Alt+F4 to quit')<CR>"
inoremap <silent> <nowait> <C-x> <C-o>:call CloseBuffer()<CR>
" nnoremap <expr> <silent> <nowait> <C-x> winnr() == 1 && line('$') == 1 && getline('.') == '' ? ":bd!<CR>" : winnr('$') > 1 ? ":bd!<CR>" : ":tabclose!<CR>"
nnoremap <silent> <nowait> <C-x> :call CloseBuffer()<CR>

" C-t: open new tab
inoremap <silent> <nowait> <C-t> <C-o>:tabnew<CR>
nnoremap <silent> <nowait> <C-t> :tabnew<CR>
snoremap <silent> <nowait> <C-t> <Esc>:tabnew<CR>
vnoremap <silent> <nowait> <C-t> <Esc>:tabnew<CR>

" C-Del
inoremap <silent> <nowait> <C-Del> <C-o>dw
nnoremap <silent> <nowait> <C-Del> dw

" C-Backspace
inoremap <silent> <nowait> <C-Backspace> <C-o>db
nnoremap <silent> <nowait> <C-Backspace> db

" End: go to end of line
nnoremap <silent> <nowait> <End> $<Right>
snoremap <silent> <nowait> <End> <Esc>$
xnoremap <silent> <nowait> <End> $

" <ScrollWheelUp> <ScrollWheelDown>
inoremap <silent> <nowait> <ScrollWheelUp> <C-o>10k
inoremap <silent> <nowait> <ScrollWheelDown> <C-o>10j
nnoremap <silent> <nowait> <ScrollWheelUp> 10k
nnoremap <silent> <nowait> <ScrollWheelDown> 10j
xnoremap <silent> <nowait> <ScrollWheelUp> <Esc>
xnoremap <silent> <nowait> <ScrollWheelDown> <Esc>

vnoremap <silent> <nowait> <M-v> <nop>
xnoremap <silent> <nowait> <Up> k
xnoremap <silent> <nowait> <Down> j
xnoremap <silent> <nowait> <Left> h
xnoremap <silent> <nowait> <Right> l
" vnoremap <silent> <nowait> <C-Space> w
xnoremap <silent> <nowait> <Backspace> d
" snoremap <silent> <nowait> <Backspace> d
vnoremap <silent> <nowait> <C-Backspace> b
vnoremap <silent> <nowait> <C-z> u
vnoremap <silent> <nowait> <Tab> >gv
vnoremap <silent> <nowait> <S-Tab> <gv
vnoremap <silent> <nowait> <C-c> "+ygv

vnoremap <silent> <nowait> y "+ygv
vnoremap <silent> <nowait> <C-v> "+P

vnoremap <silent> <nowait> <C-k> Vd
vnoremap <silent> <nowait> <M-o> <nop>
" snoremap <silent> <nowait> <M-w> <C-o><C-w>w

snoremap <silent> <nowait> <PageDown> <C-o>:call AvPage()<CR>
snoremap <silent> <nowait> <PageUp> <C-o>:call RePage()<CR>

" Enclose word by {} [] () "" if visual selected
xnoremap <silent> <nowait> [ di[<C-r><C-o>*]
xnoremap <silent> <nowait> { di{<C-r><C-o>*}
xnoremap <silent> <nowait> ( di(<C-r><C-o>*)
xnoremap <silent> <nowait> " "<C-r><C-o>*"

" Enclose word by {} [] () "" if selected
snoremap <silent> <nowait> { {<C-r><C-o>*}
snoremap <silent> <nowait> [ [<C-r><C-o>*]
snoremap <silent> <nowait> ( (<C-r><C-o>*)
snoremap <silent> <nowait> " "<C-r><C-o>*"
snoremap <silent> <nowait> < <<C-r><C-o>*>

vnoremap <silent> <nowait> <ScrollWheelUp> <Esc>
snoremap <silent> <nowait> <ScrollWheelUp> <Esc>
vnoremap <silent> <nowait> <ScrollWheelDown> <Esc>
snoremap <silent> <nowait> <ScrollWheelDown> <Esc>

" C-S-Right/Left: select word under cursor
inoremap <silent> <nowait> <C-S-Right> <S-Right>e<C-g>
inoremap <silent> <nowait> <C-S-Left>  <S-Left>b<C-g>
vnoremap <expr> <silent> <nowait> <C-S-Right> getline('.')[col('.')-1] == ' ' ? "w" : "e"
vnoremap <expr> <silent> <nowait> <C-S-Left> getline('.')[col('.')-2] == ' ' ? "gel" : "b"

" highlight the visual selection after pressing enter.
"snoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>
" vnoremap <silent> <cr> "*y:silent! let searchTerm = '\V'.substitute(escape(@*, '\/'), "\n", '\\n', "g") <bar> let @/ = searchTerm <bar> echo '/'.@/ <bar> call histadd("search", searchTerm) <bar> set hls<cr>
command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

augroup BufWinIn

   autocmd!
   " refresh directory listing if entering NERDTree
   " autocmd BufEnter,BufRead NERD_tree* stopinsert | silent! :NERDTreeRefreshRoot
   " autocmd BufEnter netrw* stopinsert | call feedkeys("2<Down>")
   autocmd BufEnter,BufRead help* stopinsert
   autocmd BufEnter,BufRead netrw* stopinsert
   " ensure NERDTree is always open
   " autocmd BufEnter * if ((&ft != "help" && &ft != "nerdtree" && &ft != "netrw") && g:NERDTree.IsOpen() == 0) | :NERDTree | :wincmd p | endif
   " autocmd BufEnter * if ((&ft != "help") && (&ft != "nerdtree") && (&ft != "netrw")) | :NERDTree | :wincmd p | endif
   autocmd BufEnter * if ((&ft != "help") && (&ft != "netrw") && (&ft != "nerdtree")) | startinsert | endif
   " Add dictionary for current filetype when adding the buffer or creating it
   autocmd BufAdd,BufCreate,BufNewFile * call AddFtDict()
   " autocmd BufEnter * call IabbrevSnippet()
   " autocmd BufEnter * if (&ft != "nerdtree") | wincmd T | endif
   " autocmd BufEnter * let cpos = getpos('.') | :%s/\s*$//g | call cursor(cpos[1], cpos[2])
   " autocmd WinNew,WinLeave * exec "normal! \<C-w>="
   " autocmd BufCreate,BufDelete * exec "normal! \<C-w>="
augroup END

augroup Insert
   autocmd!
   " autocmd InsertCharPre * startinsert
   " autocmd InsertEnter * echo '' | set cul | :let b:_search=@/|let @/=''
   " autocmd InsertEnter * set nohlsearch | hi Cursor guibg=#00ff00 | hi CursorLine guibg=#555555
   " autocmd InsertLeave,WinLeave * echo '' | set nocul
   " autocmd InsertLeave * hi Cursor guibg=#FFE800 | :let @/=get(b:,'_search','')
   " autocmd InsertLeave * set hlsearch | hi Cursor guibg=#FFE800 | hi CursorLine guibg=#0000AA
   " autocmd CmdwinEnter * set nohlsearch | hi Cursor guibg=#00ff00 | hi CursorLine guibg=#ffa556
augroup END

augroup Vim
   autocmd!
   " do not autofold when opening a file
   autocmd BufWinEnter * normal zi
   " autocmd VimEnter * if bufname('.') == '' && line('.') == 1 && getline('.') == '' | :NERDTree | only | endif
   " autocmd VimEnter * if bufname('.') == '' | :NERDTree | only | endif
   autocmd BufWritePost,BufNewFile,BufRead *.vim set filetype=vim
   " autocmd VimEnter * if argc() == 0 | :NERDTree | set noinsertmode | endif
   " autocmd VimEnter * if isdirectory(bufname('%')) | :NERDTree | set noinsertmode | endif
   autocmd VimEnter * call AutoCompleteInoremap()
   " autocmd FileType netrw setlocal relativenumber
   autocmd TabNew * :$tabmove
   " autocmd TabLeave * if winnr('$') == 1 && &ft == "nerdtree" | silent! :NERDTreeClose | :tabclose | endif
   autocmd CmdwinEnter,ModeChanged * call UpdateCursorLineMode()
   autocmd CursorMoved,CursorMovedI * call HighlightWordUnderCursor()
augroup END

augroup Markdown
   autocmd!
   autocmd BufNewFile,BufRead *.md,*markdown set filetype=markdown
augroup END

augroup Html
   autocmd!
   autocmd BufNewFile,BufRead *.html,*.htm set filetype=html
augroup END


