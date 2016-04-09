set nocompatible

call plug#begin('~/.vim/plugged')
" My Plugins here:
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'benekastah/neomake'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'sukima/xmledit'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'Shougo/deoplete.nvim'
" My Plugins ends

call plug#end()

" Load Matchit plugin
runtime macros/matchit.vim
" Don't load MathParen plugin
"let loaded_matchparen = 1

" Execute Neomake after save
autocmd! BufWritePost * Neomake
" Open Neomake list window
let g:neomake_open_list = 2
let g:neomake_list_height = 3
let g:neomake_airline = 1

" Use system clipboard by default
"set clipboard=unnamed
set clipboard+=unnamedplus

" airline display opened buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Enable deoplete
let g:deoplete#enable_at_startup = 1

filetype plugin indent on
"set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
"set vb                            " enable visual bell (disable audio bell)


syntax enable             " enable syntax highlighting (previously syntax on).
set laststatus=2          " last window always has a statusline
set et sta sw=2 sts=2 ts=2 
set fileencodings=utf-8,utf-16le,chinese,big5,latin1
"set smartcase
set number
"set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set hlsearch
set ignorecase            " Make searches case-insensitive.
"set ruler
set shiftround            " always indent/outdent to the nearest tabstop
set autoindent            " auto-indent
"set nowrap                " don't wrap text

set t_Co=256              " enable 256-color mode.
colo desert
set gfn=Menlo:h14

let mapleader=','
set timeoutlen=400
noremap Q <Esc>
noremap <Leader>ll :tabnext<CR>
noremap <Leader>hh :tabprevious<CR>
noremap <Leader>l <C-w>l
noremap <Leader>h <C-w>h
noremap <Leader>k <C-w>k
noremap <Leader>j <C-w>j
noremap <Leader>s :w<CR>
noremap <Leader>d :bdelete<CR>
noremap <Leader>q :q<CR>
noremap <Leader>b :TagbarToggle<CR>
noremap <Leader>n :NERDTreeToggle<CR>

" Use a common directory for backups and swp files
" Create it if it doesn't exist
silent execute '!mkdir -p ~/.vim_backups'
set backup             " keep a backup file (restore to previous version)
set backupdir=~/.vim_backups//
set undofile           " keep an undo file (undo changes after closing)
set undodir=~/.vim_backups//
set directory=~/.vim_backups// " keep swap files here
"set spell spelllang=en_us

" delimitMate settings
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_smart_quotes = 1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
"noremap <C-p> :CtrlPMixed<CR>

set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on


" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Automatically source vimrc after save
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Convenient command to see the diffrence between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

"Neovim: Use a blinking upright bar cursor in Insert mode, a blinking block in normal
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
"Vim: Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
    let &t_SI = "\<Esc>[5 q"
    let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif
