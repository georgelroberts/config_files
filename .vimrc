set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" "filesystem
" Plugin 'scrooloose/nerdtree'

""code folding
Plugin 'kalekundert/vim-coiled-snake'

" Plugin 'dracula/vim'
Plugin 'crusoexia/vim-monokai'
" Plugin 'ErichDonGubler/vim-sublime-monokai'

Plugin 'vim-airline/vim-airline'

" Remove whitespace with :StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'majutsushi/tagbar'

Plugin 'Yggdroot/indentLine'

Plugin 'tomtom/tcomment_vim'

Plugin 'mbbill/undotree'

" Correct syntax highlighting
Plugin 'vim-python/python-syntax'

Plugin 'cohama/lexima.vim'

Plugin 'elzr/vim-json'

Plugin 'easymotion/vim-easymotion'

Plugin 'kshenoy/vim-signature'

Plugin 'kien/ctrlp.vim'

call vundle#end()

filetype plugin indent on    " enables filetype detection
syntax on

" Syntax highlighting
let g:python_highlight_all = 1

set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1

set cursorline
set hlsearch
set incsearch

set showcmd
let mapleader=','
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" PDB remap
nnoremap <leader>p obreakpoint()<Esc>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others --exclude-standard %s']
let g:ctrlp_custom_ignore = 'py27/'

let g:SimpylFold_docstring_preview = 1

" Remap tagbar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_sort = -1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 0

set updatetime=500

let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"turn on numbering
set nu

set background=dark
set termguicolors
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" Keep indentation level from previous line:
autocmd FileType python set autoindent
autocmd FileType python set smartindent
" make backspaces more powerfull
set backspace=indent,eol,start

set splitbelow
set splitright


"YAPF automatically encodes PEP8 if leader-y is pressed
" autocmd BufWritePre *.py 0,$!yapf
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>

au BufNewFile *.py 0r ~/.vim/skeleton.py

"Folding based on indentation:
" autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Vertical lines
let g:indentLine_char = '|'

" Undo tree
nnoremap <F3> :UndotreeToggle<cr>
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif
let g:undotree_SetFocusWhenToggle = 1

nnoremap <leader>z Gzz

" Highlight 'self'
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
