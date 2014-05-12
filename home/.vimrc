execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai
set guifont=Inconsolata-dz\ for\ Powerline:h18
set laststatus=2

""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set noexpandtab                   " use spaces, not tabs
"" set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

set listchars=""
"" set listchars=tab:\ \
set listchars+=trail:.
set listchars+=extends:>

set listchars+=precedes:<

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

map <C-n> :NERDTreeToggle<CR>

let g:go_disable_autoinstall = 1

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup