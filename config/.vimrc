"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Peter Lee
" Section:
"       -> General
"       -> Vim User Interface
"       -> Colors and Fonts
"       -> Files, backups and undo 
"       -> Text, tab and indent related
"       -> Visual mode related
"       -> Moving around, tabs, windows and buffers
"       -> spell checking
"       -> Misc
"       -> Plugin & Extension 
"       -> Helper Function 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu
" Set the first matching behavior to longest:full(longest match & turn on wildmenu)
" the second matching behavior 
set wildmode=longest:full,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Highlight only in command prompt
" augroup vimrc-incsearch-highlight
    " autocmd!
    " autocmd CmdlineEnter /,\? :set hlsearch
    " autocmd CmdlineLeave /,\? :set nohlsearch
" augroup END

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell

" Show line and enable relative line number
set number
set relativenumber

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" hide mode bar because of duplication of Plugin'itchyny/lightline.vim'
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

" Enable 256 colors palette
set t_Co=256

try
    colorscheme peachpuff 
catch
endtry

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

map <F11> gT
map <F12> gt

" Auto indent
set ai 
" Smart indent
set si
" Wrap lines
set wrap 
" c indent
set cin

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <leader><Space> to ? (backwards search)
map <leader><space> ?

set splitbelow

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Split window mapping
map <leader>sb :sb 

" Close the current buffer
map <leader>bd :bd<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Move next or previous from and to buffer
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn " . g:lasttab <CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" eliminate delays on ESC in vim
" (timeout is used for mapping key delay)
" (ttimeout is used for key code delay)
set timeoutlen=1000 ttimeoutlen=10

" file type
set fileencodings=utf8,big5,gbk,latin1
map <C-u> :set fileencoding=utf8<CR>
map <C-g> :set fileencoding=big5<CR>

set laststatus=2
set statusline=%5*%{hostname()}:%<%{CurDir()}/
set statusline+=\ %2*%f%m
set statusline+=\ %1*\[%{&fenc}:%Y]    
set statusline+=\ %5*%=\Line:%4*%l\/%L\ %5*Column:%4*%c%V\    

map <F2> :set nu!<CR>:set relativenumber!<CR>
map <F3> :w<CR>:EXE 
map <F8> :set hls!<BAR>set hls?<CR>

map <F4> :execute "vimgrep /" .expand("<cword>") . "/j **" <Bar> cw<CR>
command -nargs=* EXE execute CP_R() . <q-args>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin & Extension 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet
let g:user_emmet_expandabbr_key = '<C-e>'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:lightline = {'colorscheme': 'wombat'}

" nerdcommenter
let g:NERDSpaceDelims=1

" ALE setting
" icons column always on
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
" show linter name, error or warning
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" sp to previous error/warning; sn to next
nmap ep <Plug>(ale_previous_wrap)
nmap en <Plug>(ale_next_wrap)
nmap et :ALEToggle<CR>
nmap ed :ALEDetail<CR>

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<TAB>"

function! CurDir()
    " let curdir = substitute(getcwd(), $HOME, "~", "")
    let prefix = " ../"
    let curdir = prefix . fnamemodify(getcwd(), ':t')
    return curdir
endfunction

highlight User1 ctermfg=red cterm=underline
highlight User2 ctermfg=green cterm=underline
highlight User3 ctermfg=yellow cterm=underline
highlight User4 ctermfg=white cterm=underline
highlight User5 ctermfg=cyan cterm=underline

set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    Plugin 'tpope/vim-fugitive'
    Plugin 'itchyny/lightline.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'tpope/vim-surround'
    Plugin 'w0rp/ale'
    Plugin 'L9'
    Plugin 'https://github.com/honza/vim-snippets'
    Plugin 'https://github.com/othree/vim-autocomplpop'
    Plugin 'https://github.com/marcweber/vim-addon-mw-utils'
    Plugin 'https://github.com/tomtom/tlib_vim'
    Plugin 'https://github.com/garbas/vim-snipmate'
    Plugin 'Raimondi/delimitMate'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'https://github.com/rking/ag.vim'
    Plugin 'http://github.com/mattn/emmet-vim/'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'davidhalter/jedi-vim'
    
    set rtp+=~/.fzf
    Plugin 'junegunn/fzf.vim'

    " All of your Plugins must be added before the following line
call vundle#end()                        " required

map ; :Files<CR> 
map <C-o> :NERDTreeToggle<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper Function 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function CP_R()
    if filereadable("makefile") || filereadable("Makefile")
        let exc = 'make'
    elseif( &ft == 'cpp')
        let cpl = 'g++ -w -o "%:r.out" -std=c++11 "%"' |
        let exc = '"./%:r.out"'
    elseif( &ft == 'c')
        let cpl = 'gcc -w -o "%:r.out" -std=c99 "%"' |
        let exc = '"./%:r.out"'
    elseif( &ft == 'java')
        let cpl = 'javac "%"' |
        let exc = 'java "%:r"'
    elseif( &ft == 'python')
        let exc = 'python3 "%"'
    elseif( &ft == 'sh')
        let exc = 'sh "%"'
    elseif( &ft == 'verilog')
        let cpl = 'iverilog "%" -o "%:r.exe"' |
        let exc = '"./%:r.exe"'
    elseif( &ft == 'ruby')
        let exc = 'ruby "%"'
    elseif( &ft == 'tex')
        let exc = 'pdflatex "%"' 
    else
        let exc = './"%"'
    endif

    if !exists('exc')
        echo 'Can''t compile this filetype ...'
        return
    endif
    if exists('cpl')
        let cp_r = 'echo "[Compiling]"; ' . cpl . ' && echo "[Running]" && time ' . exc
    else
        let cp_r = 'echo "[Running]" && time ' . exc
    endif
    return '!clear;' . cp_r . ' '
endfunction
