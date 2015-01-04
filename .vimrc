" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" line number to the left
set nonumber

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Useful settings
set history=1000
set undolevels=700

" Showing line numbers and length
set wrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

set nocp
set ruler
set title
set showmatch                   " show matching brackets"
set nocompatible
set scrolloff=5                 " keep at least 5 lines around the cursor
set list                        " show invisible characters
set listchars=tab:>·,trail:·    " but only show tabs and trailing whitespace"

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Map Esc to jj
inoremap jj <Esc>

autocmd BufWritePre * :%s/\s\+$//e

let mapleader = ","

"Strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader><space> :noh<cr>

"How to replace current word under cursor in
nmap <leader>z :%s#\<<C-r>=expand("<cword>")<CR>\>#

" bind Ctrl+<movement> Vkeys to move around the windows, instead of using
" Ctrl+w + <movement>.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l


" auto completion of code words to big phrases
function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('ipdb', 'import pdb; pdb.set_trace()')

" Split/Join {{{
"
" Basically this splits the current line into two new ones at the cursor position,
" then joins the second one with whatever comes next.
"
" Example:                      Cursor Here
"                                    |
"                                    V
" foo = ('hello', 'world', 'a', 'b', 'c',
"        'd', 'e')
"
"            becomes
"
" foo = ('hello', 'world', 'a', 'b',
"        'c', 'd', 'e')
"
" Especially useful for adding items in the middle of long lists/tuples in Python
" while maintaining a sane text width.
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^
" }}}

" Display SCons files wiith Python syntax
autocmd BufReadPre,BufNewFile SConstruct set filetype=python
autocmd BufReadPre,BufNewFile SConscript set filetype=python

let g:pydiction_location = '/vim/complete-dict'

" remembers where you were the last time you edited the file, and returns to
" the same position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" close a file with sudo permissions if opened with user perm
command W w !sudo tee % >/dev/null

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

" Use 256 colors
set t_Co=256

" =============================
" Python IDE Setup
" =============================
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Python folding
set nofoldenable

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#auto_initialization = 0
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview


" Better navigating through omnicomplete option list
" See
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

set wildmenu
set wildmode=list:longest

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" ctrlp for opening files
" cd ~/.vim/bundle
" git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
let g:ctrlp_root_markers = ['mvn.sh']
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*/build/*
set wildignore+=*/coverage/*
set wildignore+=*/htmlcov/*
set wildignore+=.html

" solorized theme
" syntax enable
" set background=dark
" colorscheme solarized
"
"

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo"
