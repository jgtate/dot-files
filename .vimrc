
set nocompatible
filetype plugin on

" colour setup
"colorscheme zellner
"colorscheme delek
"colorscheme emacs
syntax on

set expandtab                  "\
set tabstop=2                  " ) make tabs two spaces
set shiftwidth=2               "/
set mouse=a                    " turn on mouse control
set incsearch                  " turn on incremental searches
set number                     " show line numbers
set hidden                     " allow switching buffers without saving current buffer
set scrolloff=3                " always keep 3 lines visible when scrolling *
set ignorecase                 " make searches case insensitive
set smartcase                  " overrides ignorecase if uppercase used in search term
set autoindent                 " indent new lines relative to previous one
set smartindent                " change the way indenting works... it's not clear how
set autoread                   " automatically re-read any files that change during editing
set backspace=indent,eol,start " make the backspace key work for indents, work past
                               " the end of a line, and paste the start of an
                               " insertion
set bg=light                   " duh

" make matching parens readable !
hi MatchParen ctermfg=5

" key mappings
map <silent> <F4> <ESC>:w<CR>                " save buffer
noremap ss :w<CR>                            " save buffer
map <F5> gq}<CR>                             " re-format paragraph
map <silent> <C-n> :se invhlsearch<CR>       " toggle highlighting of search terms
" map <silent> \     :let @/=""<CR>            " clear highlighted terms
" map <silent> <F9> :ls<CR>:e #                " list buffers
map <silent> <F9> :BufExplorer<CR>           " list buffers
map <silent> <F10> :bp<CR>                   " switch to previous buffer
map <silent> <F11> :bn<CR>                   " switch to next buffer
map <silent> <F12> :e .<CR>                  " select file and open in a new buffer
nmap <silent> <leader>nt :NERDTreeToggle<CR> "\ open NERDTree
map <F7> :NERDTreeToggle<CR>                 "/
map <C-H> <C-W>h                             "\
map <C-J> <C-W>j                             " | map control + movement key to 
map <C-K> <C-W>k                             " | "switch to split"
map <C-L> <C-W>l                             "/
map <leader>du yypkgccj                      " duplicate the current line and comment the original

" noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr> " map 'K' to perldoc
set pastetoggle=<F8>                   " toggle paste mode

" abbreviations
iab __HOME__  /nfs/users/nfs_j/jt6
iab strictl   strict;
iab warningsl warnings;

" set template toolkit template files to be syntax highlighted as html
autocmd bufread *.tt set filetype=tt2

" switch off syntax highlighting for pdb files
autocmd bufenter *.ent setlocal syntax=
autocmd bufenter *.pdb setlocal syntax=

" subvert the "make" command to compile perl
" autocmd filetype perl set makeprg=perl\ -c\ %\ $*
" autocmd filetype perl set errorformat=%f:%l:%m
" autocmd filetype perl set autowrite

" use perltidy to clean up perl code (hit "=")
autocmd Filetype perl :set equalprg=perltidy

" setup the GUI
" set guifont=-misc-monospace-medium-r-semicondensed-*-*-110-*-*-c-*-koi8-r
set guifont=Monospace\ 8
set guioptions=aegirL
nmap <silent> <F2> :set go-=m<CR> " turn off the menubar
nmap <silent> <F3> :set go+=m<CR> " turn on  the menubar

" for TT2 syntax highlighting
au BufNewFile,BufRead *.tt2
    \ if ( getline(1) . getline(2) . getline(3) =~ '<\chtml'
    \           && getline(1) . getline(2) . getline(3) !~ '<[%?]' )
    \   || getline(1) =~ '<!DOCTYPE HTML' |
    \   setf tt2html |
    \ else |
    \   setf tt2 |
    \ endif

let b:tt2_syn_tags = '\[% %] <!-- -->' 

"-------------------------------------------------------------------------------
"- plugin configurations -------------------------------------------------------
"-------------------------------------------------------------------------------

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorLine=1
let NERDTreeChDirMode=2

"-------------------------------------------------------------------------------

" VCSCommand
" reset the command prefix
let VCSCommandMapPrefix="<Leader>v"

