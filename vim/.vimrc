runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
filetype plugin indent on
syntax on
" Repeat the last command
set fo-=t
set modelines=0

" solarized settings
if has('gui_running')
    set background=light
else
    set background=dark
endif
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized 

" Using two spaces with sentences
"set cpo+=J

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by defau
set foldlevel=1         "this is just what i use

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Skeleton files
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

set undofile " allow undo even after file is closed
" Store swap files in fixed location, not current directory.
"set dir=~/.vimswap//,/var/tmp//,/tmp//,.
"set undodir=~/.vimswap//,/var/tmp//,/tmp//,.

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"set textwidth=70
"  nnoremap = gq 
" Turn off line wrapping when in word processor mode
"nnoremap <F3> :set formatoptions=1<CR>
"set formatoptions-=t

" We're going to learn to love vim the hard way
"nn <F7> :setlocal spell! spell?<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Reload .vimrc after saving
autocmd BufWritePost .vimrc source %

" Less shift key presssing
nnoremap ; :

" Less escape key reaching
inoremap kj <ESC>

nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
" Save when losing focus
au FocusLost * :wa
" Fly between buffers
nnoremap <leader>l :ls<CR>:b<space>
set splitright
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Set a default colorscheme for the linux console
if $TERM == 'linux' && $COLORTERM == ''
    colorscheme default
endif

" Mouse scrolling!
set mouse=a

"au BufRead,BufNewFile *.go set noet ts=4 sw=4
"autocmd FileType go compiler golang
"autocmd! BufWritePre *.go Fmt

" Load all vimrc files specified in VIMRC
"for f in split($VIMRC, ' ')
    "exe 'source' f
"endfor
