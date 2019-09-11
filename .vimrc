set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"filesystem
Plugin 'scrooloose/nerdtree'

""code folding
" Plugin 'tmhedberg/SimpylFold'
Plugin 'kalekundert/vim-coiled-snake'

" Plugin 'dracula/vim'

Plugin 'crusoexia/vim-monokai'
Plugin 'ErichDonGubler/vim-sublime-monokai'

Plugin 'vim-airline/vim-airline'

" Plugin 'tpope/vim-fugitive'

" Remove whitespace with :StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'skywind3000/asyncrun.vim'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'majutsushi/tagbar'

Plugin 'Yggdroot/indentLine'
" Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'tomtom/tcomment_vim'

Plugin 'mbbill/undotree'

" Correct syntax highlighting
Plugin 'vim-python/python-syntax'

Plugin 'jiangmiao/auto-pairs'

" Plugin 'ervandew/supertab'
" Plugin 'Valloric/YouCompleteMe'

" Smooth scrolling
" Plugin 'yuttie/comfortable-motion.vim'

Plugin 'elzr/vim-json'

" Plugin 'prabirshrestha/asyncomplete.vim'

" Plugin 'HerringtonDarkholme/yats.vim'

" Plugin 'nvie/vim-flake8'

" Plugin 'davidhalter/jedi-vim'
call vundle#end()

filetype plugin indent on    " enables filetype detection
" set omnifunc=syntaxcomplete#Complete
" set nosmarttab

" Syntax highlighting
let g:python_highlight_all = 1

" Save on focus lost
" inoremap <Esc><Esc> <Esc>:w<CR>
" :au FocusLost * :wa

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" imap <c-space> <Plug>(asyncomplete_force_refresh)

set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1

set cursorline
set hlsearch
set incsearch
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" PDB remap
nnoremap <leader>p opdb.set_trace()<Esc>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others --exclude-standard %s']
let g:ctrlp_custom_ignore = 'py27/'

let g:SimpylFold_docstring_preview = 1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
" let NERDTreeActivateNode='<tab>'

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>
let g:asyncrun_mode=0
function! s:compile_and_run()
    exec 'w'
    if &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction

"augroup vimrc
"    autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)
"augroup END

nnoremap <F6> :call <SID>stop_async()<CR>
function! s:stop_async()
    exec "AsyncStop!"
endfunction

" let g:asyncrun_open = 15
" Press f9 to open quickfix
:noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>

" Remap tagbar
nmap <F4> :TagbarToggle<CR>
let g:tagbar_sort = -1
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_compact = 1
let g:tagbar_show_linenumbers = 0

set updatetime=500

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Strip whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"turn on numbering
set nu

" set Vim-specific sequences for RGB colors
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
"Colors
" let g:dracula_colorterm=0

" color dracula
" set background=dark
" colorscheme material
" let g:material_theme_style = 'dark'
" colorscheme dracula
" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1
" let g:sublimemonokai_gui_italic = 1
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" "Vim completes me
" autocmd FileType vim let b:vcm_tab_complete = 'vim'

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
" highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
" au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

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

" Smooth scrolling
" let g:comfortable_motion_scroll_down_key = "j"
" let g:comfortable_motion_scroll_up_key = "k"

" Move lines with alt-key

" let c='a'
" while c <= 'z'
" 	exec "set <A-".c.">=\e".c
" 	exec "imap \e".c." <A-".c.">"
" 	let c = nr2char(1+char2nr(c))
" endw

" set timeout ttimeoutlen=50
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Redraw syntax folding from the start
" nnoremap U :syntax sync fromstart<cr>:redraw!<cr>
" autocmd BufWritePost * syntax sync fromstart
" autocmd BufWritePost * redraw!

" Vertical lines
let g:indentLine_char = '|'
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1

" Undo tree
nnoremap <F3> :UndotreeToggle<cr>
if has("persistent_undo")
	set undodir=~/.undodir/
	set undofile
endif
let g:undotree_SetFocusWhenToggle = 1

nnoremap <leader>z Gzz

" Linter
" let g:flake8_quickfix_location="vertical botright"
" let g:flake8_quickfix_height=135

" Highlight 'self'
augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
