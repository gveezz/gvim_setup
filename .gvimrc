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

let g:mapleader = '\'
let g:skip_defaults_vim=1

" let g:ctrlp_clear_cache_on_exit = 1
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_cmd='CtrlP :pwd'

let g:netrw_mousemaps= 0
" hide netrw menu
let g:netrw_banner = 0
" tree listing
let g:netrw_liststyle = 0
" open files in new tab
let g:netrw_browse_split = 0
let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"
let g:netrw_fastbrowse = 1
let g:netrw_list_hide = '^\.\.\/,^\.\/'
let g:netrw_hide = 1
let g:netrw_dirhistmax = 0
let g:netrw_winsize = 25
let g:netrw_preview = 1
let g:netrw_altfile = 1

" let g:AutoClosePairs = { '(': ')', '{': '}', '[': ']' }
" let g:AutoCloseOn = 0
" let g:loaded_AutoClose = 1

" if v:version < 700 || exists('loaded_bclose') || &cp
"     finish
" endif
" let loaded_bclose = 1
"
" let b:did_indent = 1
" 
" let g:indentLine_enabled = 1
" let g:indentLine_setColors = 1
" let g:indentLine_defaultGroup = 'SpecialKey'
" let g:indentLine_color_gui = '#AAAAAA'
" let g:indentLine_char_list = ['|']

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
" set timeout timeoutlen=10 ttimeoutlen=1
" set updatetime=100
set notimeout
set timeoutlen=0
set ttimeoutlen=0
set tags=tags;/
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
set expandtab  
set autoindent
" set smartindent
" set cindent
" set copyindent
set tabstop=3
set softtabstop=0
set shiftwidth=3
" set indentexpr=
" set smarttab
set number
set relativenumber
set guifont=Monospace\ 11
set background=dark
set laststatus=2
" set statusline=%{GetMode()}\ %F\ %m\ %#StatusLine#%r%*\ BUFF#%n\ WIN#%{winnr()}\ (L:\ %l/%L\ \(%p%%),\ C:\ %c,\ BYTES:\ %o\)
set statusline=%f\ %y\ %m\ %#StatusLine#%r%*\ b#%n\ %w#%{winnr()}\ (l:\ %l/%L\ %p,\ c:\ %c,\ v:%v)\ %{GetMode()}
set backspace=indent,eol,start
set guicursor=n-c:ver100-blinkwait175blinkon250-blinkoff250-nCursor,i:ver100-blinkoff0-iCursor,v:ver100-blinkoff0-vCursor
"set guicursor=n-v-c:ver25-Cursor,o:ver25-Cursor,i-ci:ver25-iCursor,r-cr:ver25-Cursor/lCursor,sm:ver25-Cursor-blinkwait175-blinkoff150-blinkon17
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
set complete=.,k,t,i,w,b
set completeopt+=menuone,preview
set hidden
set hlsearch
set incsearch
set timeoutlen=0
set ttimeoutlen=0
syntax enable
set textwidth=80
set colorcolumn=80
" set wrapmargin=0
" set linebreak
" set wrap
" set linebreak
" note trailing space at end of next line
set columns=171
set lines=51
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

set bufhidden=unload
set switchbuf=useopen

" set showmatch
set foldenable
set foldmethod=indent
set foldnestmax=20
set foldcolumn=0
set fillchars=stl:\ ,stlnc:\ ,vert:\|,fold:\ ,diff:-

let g:bclose_multiple = 0
let g:searchString = ""

augroup BufWinIn
   autocmd!
   autocmd BufEnter,BufRead * normal! zR
   autocmd BufEnter,BufRead help* stopinsert
   autocmd BufEnter,BufRead netrw* stopinsert
   autocmd BufEnter * if ((&ft != "help") && (&ft != "netrw") && (&ft != "nerdtree")) | startinsert | endif
   autocmd BufAdd,BufCreate,BufNewFile * silent! call AddFtDict()
augroup END

augroup Insert
   autocmd!
   autocmd InsertLeave * set iminsert=0
   autocmd InsertEnter * set iminsert=1
augroup END

augroup Vim
   autocmd!
   autocmd VimEnter * call AutoCompleteInoremap()
   autocmd TabNew * :$tabmove
   " autocmd CmdwinEnter,ModeChanged * silent! call UpdateCursorMode()
   autocmd CursorMoved,CursorMovedI * silent! call HighlightWordUnderCursor()
augroup END

augroup AutoFoldColumn
  au!
  au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
augroup END

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
" inoremap <silent> <nowait> <C-.> <C-o>

" inoremap <silent> <nowait> <Esc> <C-o><Esc>
" nnoremap <silent> <nowait> <Esc> i

inoremap <expr> <silent> <nowait> <Esc> col('.')==1 ? "<Esc>" : "<Esc><Right>"
nnoremap <silent> <nowait> <Esc> i
nnoremap <silent> <nowait> <C-c> i

inoremap <silent> <nowait> <C-w> <C-o><C-w><C-w><C-w>

" inoremap <silent> <nowait> { {}<Left>
" inoremap <silent> <nowait> ( ()<Left>
" inoremap <silent> <nowait> [ []<Left>

inoremap <silent> <nowait> <C-]> <C-o>:tjump <C-r><C-w><CR>
nnoremap <silent> <nowait> <C-]> :tjump <C-r><C-w><CR>
vnoremap <silent> <nowait> <C-]> <Esc><C-c><C-r><C-w><CR>

" C-b:
inoremap <nowait> <C-b> <C-o>:b 
noremap <nowait> <C-b> :b 
" M-n: go to normal mode from insert mode
" inoremap <silent> <nowait> <M-n> <Esc>

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
" noremap <silent> <nowait> <F7> <C-o>:set relativenumber!<CR>
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
" vnoremap <silent> <nowait> <F7> <C-o>:set relativenumber!<CR>
vnoremap <silent> <nowait> <F7> <nop>
vnoremap <silent> <nowait> <F8> <Esc>
vnoremap <silent> <nowait> <F9> <Esc>
vnoremap <silent> <nowait> <F9> <Esc>
"vnoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<Esc>:set columns=999<CR>" : "<Esc>:set columns=171<CR>"
vnoremap <silent> <nowait> <F12> <nop>
" snoremap <silent> <nowait> <F7> <C-o>:set relativenumber!<CR>
snoremap <silent> <nowait> <F7> <nop>
snoremap <silent> <nowait> <F8> <Esc>
snoremap <silent> <nowait> <F9> <Esc>
snoremap <silent> <nowait> <F9> <Esc>
" snoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<Esc>:set columns=999<CR>" : "<Esc>:set columns=171<CR>"
snoremap <silent> <nowait> <F12> <nop>

" F11: toggle full screen
inoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<C-o>:set columns=999<CR>" : "<C-o>:set columns=171<CR>"
nnoremap <expr> <silent> <nowait> <F11> (&columns <= 100) ? "<C-o>:set columns=999<CR>" : "<C-o>:set columns=171<CR>"

" <Home>: jump before the first non-blank of the current line
inoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "<C-o>^" : "<C-o>0"
nnoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "^" : "0"
vnoremap <expr> <silent> <nowait> <Home> getline('.')[:col('.')-2] =~ '\w' ? "^" : "0"
snoremap <expr> <silent> <nowait> <S-Home> getline('.')[:col('.')-2] =~ '\w' ? "<C-o>^" : "<C-o>0"

" C-c: command line mode
inoremap <nowait> <M-x> <C-o>:
nnoremap <nowait> <M-x> :
snoremap <nowait> <M-x> <C-o>:
xnoremap <nowait> <M-x> <C-c>:'<,'>
tnoremap <silent> <nowait> <Esc> <C-\><C-n>
cnoremap <nowait> <M-x> <C-c>:

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

" Backspace: behave as in normal mode
" nnoremap <expr> <silent> <nowait> <Backspace> col('.') == 1 ? "k$<Right>" : "dh"

" Tab: advance completition selection if pumvisible, Tab otherwise
inoremap <expr> <silent> <nowait> <Tab> pumvisible() != 0 ? "<C-N>" : "<Tab>"
nnoremap <silent> <nowait> <Tab> >>

" S-Tab: de-advance completition selection if pumvisible, inverse Tab otherwise
inoremap <expr> <silent> <nowait> <S-Tab> pumvisible() != 0 ? "<C-p>" : "<C-d>"
nnoremap <silent> <nowait> <S-Tab> <<

inoremap <silent> <nowait> <C-Enter> <C-o>n
nnoremap <silent> <nowait> <C-Enter> n

inoremap <silent> <nowait> <C-M-Enter> <C-o>#
nnoremap <silent> <nowait> <C-M-Enter> #

inoremap <nowait> <C-f> <C-o>:call setreg('/', '')<CR><Esc>/
" inoremap <expr> <nowait> <C-f> (strlen(getreg('/')) > 0) ? "<Esc>/<C-r>/" : "<Esc>/"
nnoremap <nowait> <C-f> :call setreg('/', '')<CR>/
xnoremap <nowait> <C-f> <Esc><C-c>:call setreg('/', '')<CR>:%s/<C-r>*//gn<CR>
xnoremap <nowait> <C-M-Space> <Esc><C-c>:call setreg('/', '')<CR>:%s/<C-r>*//gn<CR>
snoremap <nowait> <C-f> <Esc><C-c>:call setreg('/', '')<CR>:%s/<C-r>*//gn<CR><Esc>
snoremap <nowait> <C-M-Space> <Esc><C-c>:call setreg('/', '')<CR>:%s/<C-r>*//gn<CR><Esc>
" cnoremap <expr> <silent> <nowait> <C-f> (strlen(getreg('/')) > 0) ? "<C-c>/<C-r>/<CR>" : "<C-c>:call EchoWarnMsg('Empty search')<CR>"
cnoremap <silent> <nowait> <C-f> <C-c>:call setreg('/', '')<CR>/<C-r>/<CR>zz

vnoremap <nowait> <C-S-f> <C-o>?<CR>
nnoremap <nowait> <C-M-Backspace> ?<CR>

" C-.: toggle code fol=ding
inoremap <silent> <nowait> <C-.> <C-o>zczz
nnoremap <silent> <nowait> <C-.> zczz
xnoremap <silent> <nowait> <C-.> <Esc><C-c>zFzz
snoremap <silent> <nowait> <C-.> <C-o>zFzz

" C-v: Paste
inoremap <nowait> <C-v> <C-r><C-o>+
nnoremap <nowait> <C-v> <C-r><C-o>+
vnoremap <nowait> <C-v> <C-r><C-o>+
"xnoremap <nowait> <C-v> <C-r><C-o>+
"snoremap <nowait> <C-v> <C-r><C-o>+
tnoremap <nowait> <C-v> <C-W>"+
cnoremap <nowait> <C-v> <C-r>+

inoremap <nowait> <M-v> <C-r>+
nnoremap <nowait> <M-v> <C-r>+
vnoremap <nowait> <M-v> <C-r>+


" C-l: prompt replace
inoremap <nowait> <C-l> <C-o>:call BufferList()<CR>
nnoremap <nowait> <C-l> :call BufferList()<CR>
snoremap <nowait> <C-l> <C-o>:call BufferList()<CR>


" C-r: prompt replace
" inoremap <nowait> <C-r> <C-o>:call PromptReplI()<CR>
" nnoremap <nowait> <C-r> :call PromptReplI()<CR>
" snoremap <nowait> <C-r> <C-o>:call PromptReplS()<CR>
" cnoremap <silent> <nowait> <C-r> <C-c>

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


" MiddleMouse: paste as well
" inoremap <silent> <nowait> <MiddleMouse> <C-o>"+P
" nnoremap <silent> <nowait> <MiddleMouse> "+P
" xnoremap <silent> <nowait> <MiddleMouse> <nop>
inoremap <silent> <nowait> <MiddleMouse> <nop>
nnoremap <silent> <nowait> <MiddleMouse> <nop>
vnoremap <silent> <nowait> <MiddleMouse> <nop>

" M-v: block paste
inoremap <silent> <nowait> <M-v> <C-o>:put "+<CR>

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

" C-n
inoremap <silent> <nowait> <C-n> <C-o>:vnew<CR>
nnoremap <silent> <nowait> <C-n> :vnew<CR>
xnoremap <silent> <nowait> <C-n> <Esc><C-o>:vnew<CR>

" C-M-n
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

" C-Up: 
" inoremap <silent> <nowait> <C-Up> <C-o>:call BetterBufferPrev()<CR>
" nnoremap <silent> <nowait> <C-Up> :call BetterBufferPrev()<CR>
" vnoremap <silent> <nowait> <C-Up> <Esc><C-o>:call BetterBufferPrev()<CR>

" C-Down:
" inoremap <silent> <nowait> <C-Down> <C-o>:call BetterBufferNext()<CR>
" nnoremap <silent> <nowait> <C-Down> :call BetterBufferNext()<CR>
" vnoremap <silent> <nowait> <C-Down> <Esc><C-o>:call BetterBufferNext()<CR>


" C-Right: forward word movement
inoremap <expr> <silent> <nowait> <C-Right> getline('.')[col('.')-1] == ' ' ? "<C-o>w" : "<C-o>e<Right>"
nnoremap <expr> <silent> <nowait> <C-Right> getline('.')[col('.')-1] == ' ' ? "w" : "e<Right>"
" C-Left: Backward word movement
inoremap <expr> <silent> <nowait> <C-Left> getline('.')[col('.')-2] == ' ' ? "<C-o>ge<Right>" : "<C-o>b"
nnoremap <expr> <silent> <nowait> <C-Left> getline('.')[col('.')-2] == ' ' ? "ge<Right>" : "b"

" C-x: close current buffer
inoremap <silent> <nowait> <C-x> <C-o>:call CloseBuffer(1)<CR>
nnoremap <silent> <nowait> <C-x> :call CloseBuffer(1)<CR>
tnoremap <silent> <nowait> <C-x> exit<CR>

inoremap <silent> <nowait> <C-M-x> <C-o>:call CloseBuffer(0)<CR>
nnoremap <silent> <nowait> <C-M-x> :call CloseBuffer(0)<CR>

vnoremap <silent> <nowait> + <C-a>
vnoremap <silent> <nowait> <kPlus> <C-a>
vnoremap <silent> <nowait> - <C-x>
vnoremap <silent> <nowait> <kMinus> <C-x>

" C-t: open new tab
inoremap <silent> <nowait> <C-t> <C-o>:tabnew<CR>
nnoremap <silent> <nowait> <C-t> :tabnew<CR>
snoremap <silent> <nowait> <C-t> <Esc>:tabnew<CR>
vnoremap <silent> <nowait> <C-t> <Esc>:tabnew<CR>

" C-Del
inoremap <expr> <silent> <nowait> <C-Del> (col('.')-1)==strlen(getline('.')) ? "<Del>" : "<C-o>dw"
nnoremap <silent> <nowait> <C-Del> dw

" C-Backspace
inoremap <silent> <nowait> <C-Backspace> <C-o>db
nnoremap <silent> <nowait> <C-Backspace> db

" End: go to end of line
nnoremap <silent> <nowait> <End> $<Right>
snoremap <silent> <nowait> <End> <Esc>$
xnoremap <silent> <nowait> <End> $

" <ScrollWheelUp> <ScrollWheelDown>
inoremap <silent> <nowait> <ScrollWheelUp> <ScrollWheelUp><ScrollWheelUp><ScrollWheelUp>
inoremap <silent> <nowait> <ScrollWheelDown> <ScrollWheelDown><ScrollWheelDown><ScrollWheelDown>
nnoremap <silent> <nowait> <ScrollWheelUp> <ScrollWheelUp><ScrollWheelUp><ScrollWheelUp>
nnoremap <silent> <nowait> <ScrollWheelDown> <ScrollWheelDown><ScrollWheelDown><ScrollWheelDown>
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
tnoremap <silent> <nowait> <C-c> <C-\><C-n><C-w>N<C-\><C-n>

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

