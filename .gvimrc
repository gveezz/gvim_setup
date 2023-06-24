" vimrc version. vim 8.1
let $VIMHOME = $HOME."/.vim"

let g:popupBufferPattern = "Select %f (%n) from %p directory" 

" let mapleader = ','
 let g:NERDTreeMouseMode = 3
 let g:NERDTreeShowLineNumbers = 0
 let g:NERDTreeDirArrows = 1
 let g:NERDTreeShowHidden = 1
 let g:NERDTreeQuitOnOpen = 0
 let g:NERDTreeChDirMode = 0
 let g:NERDTreeMinimalUI = 1
" let g:ctrlp_clear_cache_on_exit = 1
" let g:AutoClosePairs = { '(': ')', '{': '}', '[': ']' }
" let g:AutoCloseOn = 1

" if v:version < 700 || exists('loaded_bclose') || &cp
"     finish
" endif
" let loaded_bclose = 1

colorscheme simozz4

set insertmode
set magic
" set autochdir
set nocompatible
let skip_defaults_vim=1
set noshowmode
set viminfo=""
set incsearch
filetype plugin indent on
syntax enable
"set syntax=auto
" set timeout timeoutlen=10 ttimeoutlen=1
" set updatetime=100
" set tags=tags;/
set noswapfile
set autoread
set autowrite
set clipboard=autoselect
set guioptions-=m
set guioptions-=T
set guioptions-=e
" set guioptions-=r
set guioptions+=a
set virtualedit=onemore
set whichwrap=<,>,[,]
set selection=exclusive
set selectmode=mouse,key
set keymodel=startsel,stopsel
set shiftwidth=3
set softtabstop=0
set expandtab
set tabstop=3
"set autoindent
set smartindent 
set cindent
" set copyindent
set smarttab
set number
set guifont=Monospace\ 12
set background=dark
set laststatus=2
set statusline=%{GetMode()}\ %F\ %m\ %#StatusLineR#%r%*\ buff#%n\ (l:\ %l/%L\ \(%p%%),\ c:\ %c,\ B:\ %o\)
set backspace=indent,eol,start
set guicursor=n:ver100-blinkoff0-nCursor,i-c:ver25-blinkoff0-iCursor,v:ver25-blinkoff0-vCursor
" set splitbelow
"set ignorecase
set nocul      
set formatoptions=tcj
set mouse=a
set mousehide
set mouseshape=n:arrow,v:beam,i:beam
set mousemodel=popup
set lazyredraw
set scrolloff=0
set splitright
set complete=.
set complete+=b
set complete+=k
set completeopt+=menu,preview
set hidden
set hlsearch
set incsearch
set timeoutlen=0
syntax enable
" set textwidth=80
" set wrapmargin=0
" set columns=80
" set linebreak
set columns=100
" set history=1000

" --- CUSTOM FUNCTIONS
function! Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

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

function! EnterWinBuffer()
    
   if (&ft != 'help' && &ft != 'netrw' && &ft != 'nerdtree' && &buftype != 'terminal')
       silent! lcd %:p:h | startinsert
   else
	    silent! stopinsert
   endif
	
endfunction

"function! CtrlPExec()
"    stopinsert | CtrlP l:path
"endfunction

function! Explore()
   silent! exec ":Explore|only<CR>"
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

function! GuiSave() abort
   
    if (&ft == 'nerdtree')
        call s:Warn("Hey dude, you're in nerdtree window...")
    else
        if empty(bufname(''))
            browse confirm write
        else
            w!
        endif
     endif
endfunction

" function! GetActiveBuffers()
"     let l:blist = getbufinfo({'bufloaded': 1, 'buflisted': 1})
"     let l:result = []
"     for l:item in l:blist
"         "skip unnamed buffers; also skip hidden buffers?
"         if empty(l:item.name) || l:item.hidden
"             continue
"         endif
"         call add(l:result, shellescape(l:item.name))
"     endfor
"     return l:result
" endfunction

function! PopupBufferList()
   
   "let l:topline = line("w0")
   "let l:botline = line("w$")
   "let l:midline = float2nr((l:topline + l:botline)/2)
   "let l:cpos = getpos(".")
   "let l:cpos[1] = l:midline
   "call setpos(".", l:cpos)
   
   let menuName = "BuffersMenu"
   :aunmenu *
   " All 'possible' buffers that may exist
   let b_all = range(1, bufnr('$'))
   " Unlisted ones
   let b_unl = filter(b_all, 'buflisted(v:val)')
   for nbuff in b_unl
      let menuitem = substitute(bufname(nbuff), '\.', '\\.', 'g')
      silent! :exec ":amenu ]".menuName.".".menuitem." :b ".string(nbuff)."<CR>"
   endfor
   silent! :exec ":popup ]".menuName

endfunction

function! GetMode()
    let l:ms=mode()
    if l:ms == 'n'

	   :hi StatusLine guifg=#B0B0FF
      return 'NORMAL  '

   elseif l:ms == 'i'

	   :hi StatusLine guifg=#00ff00
      return 'INSERT  '

   elseif l:ms == 'v' || l:ms == 'V'
	   
      :hi StatusLine guifg=#AF8FFF
      return 'VISUAL  '

   elseif l:ms == 's' || l:ms == 'S'
	   
      :hi StatusLine guifg=#AF8FFF 
      return 'SELECT  '
      
   elseif l:ms == 'R' || l:ms == 'Rv'
      return 'REPLACE '

   elseif l:ms == 't'
	   
      :hi StatusLine guifg=#41DF25
      return 'TERMINAL'

   elseif l:ms == 'c'

      :hi StatusLine guifg=#FF9300
      return 'COMMAND '
      
   else
      return l:ms
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
   if len(getline('.')[col('.')-1])
      normal! dw
   elseif match(getline('.'), '^\s*$') != -1
      normal! bdw
   endif
    
endfunction

function! NerdTreeToggle()
   
   let l:winnr = winnr("$")
   " if NERDTree is open
   if &ft == 'netrw' || &ft == 'nerdtree'
      " and it is not the only open window
      if l:winnr > 1
         " close NERDTree
         silent! :NERDTreeClose
      endif
   else
      " otherwise open it
      if g:NERDTree.IsOpen() == 0
         silent! :NERDTree
      endif
   endif

endfunction



function! InComment()
   
   let l:incomment = stridx(synIDattr(synID(line('.'), col('.'), 0), 'name'), 'Comment')
   if l:incomment >= 0
      call EchoYellowMsg("In Comment")
      return 1
   else
      return 0
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

" function! IabbrevSnippet()
"    
"    let l:snippetStr = "snippet"
"    let l:snippetsStr = l:snippetStr."s"
"    let l:ftSnipFile = $VIMHOME."/".l:snippetsStr."/".&ft.".".l:snippetsStr
"    
"    if filereadable(l:ftSnipFile) > 0
"       "echom "Snippet file".l:ftSnipFile." found"
"       " exec "setlocal dict+=".l:ftdictpath
"       for l:line in readfile(l:ftSnipFile, '', 100)
"          "echom "line = ".line
"          if stridx(line, l:snippetStr) == 0
"             let l:snippetToMatch = l:line[len(l:snippetStr)+1:]
"             if len(l:snippetToMatch) > 0
"                exec ":iabbrev <silent> <buffer> ".l:snippetToMatch." ".l:snippetToMatch."<c-r>=EatcharTriggerSnippet('\s')<CR>"
"             endif
"          endif
"       endfor
"    endif
" 
" endfunction

function! AddFtDict()
      
   let l:ftdictpath = $VIMHOME."/dictionary/".&ft.".txt"
   
   if filereadable(l:ftdictpath) > 0
      exec "setlocal dict+=".l:ftdictpath
   endif

endfunction

function! CleverTab()
   
   if pumvisible() == 0
      if getline('.')[col('.') - 2] =~ '\w'
         return "\<C-N>\<C-P>"
      else
         return "\<Tab>"
      endif
   else
      return "\<C-N>"
   endif

endfunction

function! FeedCompletePopUp()
   
   return "\<C-N>\<C-P>"

endfunction

function! PromptBufferOption()
   
   let l:char = input("buffer c(lose)/n(ew)/o(pen): ")
   if l:char == 'c'
      exec ":silent! Bclose!"
   elseif l:char == 'n'
      exec ":enew!"
   elseif l:char == 'o'
      exec ":browse confirm e"
   endif

endfunction

function AutoCompleteInoremap()

  let s:keysMappingDriven = [
        \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
        \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
        \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
        \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        \ '/', '\' ]
  for key in s:keysMappingDriven
    execute "inoremap <silent> <nowait> ".key." ".key."<C-r>=FeedCompletePopUp()<CR>"
  endfor
endfunction

function! GoToLine()

   let l:line = input("Go to line: ")
   exec ":".l:line
   
endfunction

function! Esc()
   
   " do stuff I want to reset 
   " when I press <Esc>
   :MultieditReset
   set nohlsearch
endfunction

function! PromptFindI()
   :promptfind
endfunction

function! PromptReplI()
   :promptrepl
endfunction

function! PromptFindS()
   let l:sword = @*
   exec ":promptfind ".l:sword
endfunction

function! PromptReplS()
   let l:sword = @*
   exec ":promptrepl ".l:sword
endfunction

let g:multiedit_mark_character = '^'
let g:multiedit_mark_character_len = strlen(g:multiedit_mark_character)
let g:multiedit_auto_restore = 1
let g:multiedit_no_mappings = 1

" inoremap
inoremap <silent> <nowait> <C-LeftMouse> <nop>
inoremap <silent> <nowait> <C-RightMouse> <nop>
inoremap <silent> <nowait> <M-q> <C-o>:MultieditAddMark i<CR>
inoremap <silent> <nowait> <M-i> <C-o>:Multiedit!<CR>
inoremap <silent> <nowait> <ScrollWheelUp> <Up><Up><Up>
inoremap <silent> <nowait> <ScrollWheelDown> <Down><Down><Down>
inoremap <silent> <nowait> <Esc> <C-o>:call Esc()<CR><Esc>
" inoremap <silent> <nowait> <M-n> <C-o>:
inoremap <expr> <silent> <nowait> <Del> ((match(getline('.')[col('.'):], '\s*$') == 0) && (len(getline('.')[col('.'):]) > 0)) ? "<C-o>dw<Del>" : "<Del>"
inoremap <silent> <nowait> <S-Del> <nop>
inoremap <silent> <nowait> <C-kMultiply> <C-o>*
inoremap <silent> <nowait> <C-kDivide> <C-o>/
inoremap <silent> <nowait> <C-kPlus> <C-o>n
inoremap <silent> <nowait> <C-kMinus> <C-o>N
inoremap <expr> <silent> <nowait> <Enter> pumvisible() != 0 ? "<C-y><c-r>=TriggerSnippet()<CR>" : "<Enter>"
"inoremap <expr> <silent> <nowait> <Tab> getline('.')[col('.') - 2] =~ '\w' ? "<C-N><C-P>" : "<Tab>"
inoremap <silent> <nowait> <Tab> <C-r>=CleverTab()<CR>
" inoremap <expr> <silent> <nowait> <Tab> pumvisible() != 0 ? "<C-N>" : "<Tab>"
inoremap <expr> <silent> <nowait> <S-Tab> pumvisible() != 0 ? "<C-P>" : "<C-d>"
inoremap <silent> <nowait> <C-Right> <C-o>w
inoremap <silent> <nowait> <C-Left> <C-o>b
inoremap <silent> <nowait> <C-Backspace> <C-o>:call DeleteWord()<CR>
" show list of buffers
inoremap <silent> <nowait> <M-b> <C-o>:call PopupBufferList()<CR>
" prompt find on command line
inoremap <silent> <nowait> <C-f> <C-o>:call PromptFindI()<CR>
" prompt find and replace pop up window
inoremap <silent> <nowait> <M-f> <C-o>:call PromptReplI()<CR>
" inoremap <expr> <PageUp> (line('.') != winline()) ? "<C-o><PageUp>" : "<C-o>1G"
" opens a new tab
inoremap <silent> <nowait> <C-t> <C-o>:tabnew<CR>
" goes to the next tab
inoremap <silent> <nowait> <C-PageDown> <C-o>:tabnext<CR>
" goes to the previous tab
inoremap <silent> <nowait> <C-PageUp> <C-o>:tabprev<CR>

inoremap <silent> <nowait> <C-s> <C-o>:call GuiSave()<CR>
inoremap <silent> <nowait> <C-k> <C-o>dd
inoremap <silent> <nowait> <C-g> <C-o>:call GoToLine()<CR>
inoremap <silent> <nowait> <C-z> <C-o>u
inoremap <silent> <nowait> <C-y> <C-o>:redo<CR> 
inoremap <silent> <nowait> <C-j> <C-o>:call Indent()<CR>
inoremap <silent> <nowait> <C-v> <C-o>"+P
inoremap <silent> <nowait> <C-b> <C-o>:put "+<CR>
inoremap <silent> <nowait> <C-a> <Esc>ggVG
inoremap <nowait> <C-q> <C-o>:call PromptBufferOption()<CR>
inoremap <Home> <C-o>^
inoremap <S-Home> <C-o>v^

" create new empty buffer

inoremap <silent> <nowait> <M-v> <C-o><S-v>
" open pop up window to open a file (or create one)
inoremap <silent> <nowait> <M-o> <C-o>:browse confirm e<CR>

" Toggle NerdTree
" inoremap <silent> <nowait> <M-e> <C-o>:call NerdTreeToggle()<CR>
inoremap <silent> <nowait> <M-Left> <C-o>:wincmd p<CR>
inoremap <silent> <nowait> <M-Right> <C-o>:wincmd p<CR>
" inoremap <expr> <M-t> bufexists('!/bin/bash') == 0 ? "<C-o>:terminal!<CR>" : ""

nnoremap <silent> <nowait> <F2> :enew!<CR>
nnoremap <silent> <nowait> <F3> :delete!<CR>
nnoremap <silent> <nowait> <F4> :close!<CR>
noremap <silent> <nowait> <M-Left> :wincmd p<CR>
noremap <silent> <nowait> <M-Right> :wincmd p<CR>
nnoremap <silent> <nowait> k j
nnoremap <silent> <nowait> j k
nnoremap <silent> <nowait> <M-b> :call PopupBufferList()<CR><Down>
nnoremap <silent> <nowait> <C-s> :call GuiSave()<CR>
nnoremap <silent> <nowait> <C-k> dd
nnoremap <silent> <nowait> <C-z> u
nnoremap <silent> <nowait> <C-y> :redo<CR>
nnoremap <silent> <nowait> <M-o> :browse confirm e<CR>
 
"cnoremap
cnoremap <silent> <nowait> <S-Del> <nop>
cnoremap <nowait> <C-v> <C-r>"

"snoremap, vnoremap
snoremap <silent> <nowait> <F2> <C-o>:enew!<CR>
snoremap <silent> <nowait> <F3> <C-o>:delete!<CR>
snoremap <silent> <nowait> <F4> <C-o>:close!<CR>
vnoremap <silent> <nowait> <F2> <C-o>:enew!<CR>
vnoremap <silent> <nowait> <F3> <C-o>:delete!<CR>
vnoremap <silent> <nowait> <F4> <C-o>:close!<CR>
snoremap <silent> <nowait> <ScrollWheelUp> <Up><Up><Up>
snoremap <silent> <nowait> <ScrollWheelDown> <Down><Down><Down>
snoremap <silent> <nowait> <M-v> <nop>
vnoremap <silent> <nowait> <C-Space> w
snoremap <silent> <nowait> <Backspace> <Del>
vnoremap <silent> <nowait> <C-Backspace> b
snoremap <silent> <nowait> <C-z> u
snoremap <silent> <nowait> <C-k> dl
snoremap <silent> <nowait> <C-f> <C-o>:call PromptFindS()<CR>
snoremap <silent> <nowait> <M-f> <C-o>:call PromptReplS()<CR>
snoremap <silent> <nowait> <M-b> <C-o>:call PopupBufferList()<CR>
vnoremap <silent> <nowait> <Tab> >gv
vnoremap <silent> <nowait> <S-Tab> <gv
vnoremap <silent> <nowait> <C-c> "+ygv
vnoremap <silent> <nowait> <C-v> "+P
vnoremap <silent> <nowait> <C-k> Vd
vnoremap <silent> <nowait> <M-o> <nop>

command! -bang -complete=buffer -nargs=? Bclose call s:Bclose('<bang>', '<args>')

augroup BufWinIn
   
   " refresh directory listing if entering NERDTree
   autocmd BufEnter NERD_tree_* | silent! execute 'normal R'
   " ensure NERDTree is always open
   autocmd BufEnter * if &ft != "help" && &ft != "nerdtree" && &ft != "netrw" && g:NERDTree.IsOpen() != 1 | :NERDTree | endif
   " Add dictionary for current filetype when adding the buffer or creating it
   autocmd BufAdd,BufCreate * if &ft != "help" && &ft != "nerdtree" && &ft != "netrw" | silent! call AddFtDict() | endif
augroup END

augroup Insert
   
   " autocmd InsertCharPre * startinsert
   autocmd InsertEnter * echo '' | set cul | :let b:_search=@/|let @/=''
   autocmd InsertEnter * hi Cursor guibg=#00ff00 
   autocmd InsertLeave * hi Cursor guibg=#FFE800 | :let @/=get(b:,'_search','')
  
augroup END

augroup Vim
   " open NERDTree when entering gvim
   autocmd VimEnter * :NERDTree | wincmd p
   " open NERDTree when entering gvim
   autocmd VimEnter * call AutoCompleteInoremap()
   " autocmd VimEnter * if 0 == argc() | NERDTree | wincmd p | startinsert | endif
augroup END

augroup Verilog

   autocmd!
   autocmd BufNewFile,BufRead *.v,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set textwidth=80 | set wrapmargin=0 | set linebreak
   autocmd BufNewFile,BufRead *.v,*.vh,*.vinc,*.vf,*.sv,*.svh,*.svinc,*.svf set filetype=verilog
   autocmd BufNewFile,BufRead *.v,.sv if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vtemplate.v | endif
   autocmd BufNewFile,BufRead *.vh,*.svh if line('$') == 1 && getline(1) == '' | :0r$VIMHOME/templates/vhtemplate.v | endif
   autocmd BufNewFile,BufRead *.vinc,*.svinc if line('$') == 1 && getline(1) == '' | :0r $VIMHOME/templates/vinctemplate.v | endif
      
augroup END

augroup Markdown
   autocmd!
   autocmd BufNewFile,BufRead *.md,*markdown set filetype=markdown
augroup END

augroup Html
   autocmd!
   autocmd BufNewFile,BufRead *.html,*.htm set filetype=html
augroup END


