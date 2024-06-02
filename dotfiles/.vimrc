" Used with Vim 9.0 on Ubuntu 18.04 on WSL
set timeoutlen=500

" Quit
nnoremap qq <Esc>:q<Enter>
inoremap qq <Esc>:q<Enter>

" Quit + No Save 
nnoremap qqa <Esc>:q!<Enter>
inoremap qqa <Esc>:q!<Enter>

" Quit + Save Shortcut
nnoremap qqq <Esc>:wq<Enter>
inoremap qqq <Esc>:wq<Enter>

" Save
nnoremap zz <Esc>:w<Cr>
inoremap zz <Esc>:w<Cr>

" Esc remap
nnoremap `` <Esc>
inoremap `` <Esc>

" Command mode
nnoremap ]] <Esc>:
inoremap ]] <Esc>:

" Split below by default
set splitbelow

" Remap arrow keys
map h <Nop>
noremap j <Left>
noremap k <Down>
noremap l <Up>
noremap ; <Right>

" Shortcuts for pane navigation -> works for split windows outside of terminal
nnoremap <C-J> <C-W>h
nnoremap <C-K> <C-W>j
nnoremap <C-L> <C-W>k
nnoremap <C-;> <C-W>l

" Syntax color by default
syntax on 

" Visual tabs are two spaces 
set tabstop=2

" Backspace works everywhere
set backspace=indent,eol,start

" Line Numbers
set number

" Use Mouse
set mouse=a

" Temp file directories
set backup
set backupdir=$HOME/.vimfiles/tmp/backup/ 
set swapfile
set undodir=$HOME/.vimfiles/tmp/un/
set undofile
set directory=$HOME/.vimfiles/tmp/swp/

" Turn off welcome screen
set shm+=I

" Netrw (Explore) config
" keep current directory and browsing directory synced
let g:netrw_keepdir = 0
let g:netrw_winsize = 30

" Silence banner, show with "I"
let g:netrw_banner = 0
command V Vexplore

" Set Integrated Terminal Size -> Doesnt' work for vim 8.0
" set termwinsize=10x0

if has("gui_running")
    set lines=40 columns=120
    colorscheme delek_no_bold
    set guifont=consolas:h12
    set background=light
else 
    set background=dark
    set lines=45 columns=140
endif

" Turn off unnecessary beeps
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
