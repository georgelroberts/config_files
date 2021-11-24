set nocompatible
filetype off

set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
" "filesystem
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'Yggdroot/LeaderF'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'zivyangll/git-blame.vim'
Plug 'vim-test/vim-test'

""code folding
" Plug 'kalekundert/vim-coiled-snake'
" Plug 'pseewald/vim-anyfold'
" Plug 'tmhedberg/simpylfold'

" Plug 'dracula/vim'
Plug 'crusoexia/vim-monokai'
" Plug 'ErichDonGubler/vim-sublime-monokai'

Plug 'vim-airline/vim-airline'

" Remove whitespace with :StripWhitespace
Plug 'ntpeters/vim-better-whitespace'

Plug 'christoomey/vim-tmux-navigator'

Plug 'Yggdroot/indentLine'

Plug 'tomtom/tcomment_vim'

Plug 'easymotion/vim-easymotion'

Plug 'kshenoy/vim-signature'

Plug 'ajh17/VimCompletesMe'

Plug 'ludovicchabant/vim-gutentags'

Plug 'mbbill/undotree'

call plug#end()

syntax on

" Syntax highlighting
let g:python_highlight_all = 1

nnoremap <C-n> :NERDTreeToggle<CR>
let g:NERDTreeLimitedSyntax = 1


" set completeopt-=preview
" set completeopt+=menuone,noselect
" set shortmess+=c
" set belloff+=ctrlg
" let g:mucomplete#enable_auto_at_startup = 1

set cursorline
" set hlsearch
set incsearch

set showcmd
let mapleader=','
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>m :syntax sync fromstart<CR>

" PDB remap
nnoremap <leader>p obreakpoint()<Esc>

" " ctrlp
" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others --exclude-standard %s']
" let g:ctrlp_custom_ignore = 'py27/'

let g:SimpylFold_docstring_preview = 1

" Remap tagbar
nmap <F4> :TagbarToggle<CR>
nmap <leader>a :TagbarToggle<CR>
let g:tagbar_sort = -1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 1
" let g:tagbar_autopreview = 1

set updatetime=1000

let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
" <Leader>f{char} to move to {char}
map  <Leader>s <Plug>(easymotion-bd-f)
nmap <Leader>s <Plug>(easymotion-overwin-f)

" Git blame show
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']

" Whole file searc
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>

" Term search
nnoremap <leader>fcw :BLines<CR>
nnoremap <leader>fcd :BLines def <CR>
nnoremap <leader>fcc :BLines class <CR>
nnoremap <leader>fcuw :BLines <C-R><C-W><CR>
nnoremap <leader>fcud :BLines def <C-R><C-W><CR>
nnoremap <leader>fcuc :BLines class <C-R><C-W><CR>

" In project
nnoremap <leader>fpw :Ag<CR>
nnoremap <leader>fpd :Ag<Space>def<Space><CR>
nnoremap <leader>fpc :Ag<Space>class<Space><CR>
nnoremap <leader>fpuw :Ag <C-R><C-W><CR>
nnoremap <leader>fpud :Ag def <C-R><C-W><CR>
nnoremap <leader>fpuc :Ag class <C-R><C-W><CR>

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>

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
autocmd FileType python set foldmethod=syntax
"use space to open folds
nnoremap <space> za
" autocmd Filetype python AnyFoldActivate               " activate for all filetypes
" set foldlevel=0  " close all folds
" let g:anyfold_fold_display=1
" let g:anyfold_motion=0
" let g:anyfold_fold_toplevel=0
" let g:anyfold_identify_comments=2
" let g:SimpylFold_docstring_preview = 1" Preview docstring in fold text	0
" g:SimpylFold_fold_import " Fold imports	1
" b:SimpylFold_fold_import " Fold imports (buffer local)	1
" let g:SimpylFold_fold_blank=1	" Fold trailing blank lines	0
" let b:SimpylFold_fold_blank=1	" Fold trailing blanks (buffer)	0

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

" Highlight 'self'
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
