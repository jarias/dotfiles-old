execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai
set guifont=Inconsolata-dz\ for\ Powerline:h14
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
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

set listchars=""
set listchars=tab:▸\ ,eol:¬
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

" Python
" make Python follow PEP8 for whitespace ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

" GO
au BufNewFile,BufRead,BufEnter *.go setlocal noet ts=4 sw=4 sts=4

" Javascript
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead .jshintrc,jshintrc set ft=javascript
au FileType javascript setlocal ts=4 sw=4 sts=4
au FileType javascript noremap <buffer> <D-L> :call JsBeautify()<cr>

" HTML
au FileType html setlocal ts=4 sw=4 sts=4
au FileType html noremap <buffer> <D-L> :call HtmlBeautify()<cr>

" CSS or SCSS
au FileType css setlocal ts=4 sw=4 sts=4
au FileType css noremap <buffer> <D-L> :call CSSBeautify()<cr>

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g`\"" | endif

let mapleader=','

" NERDTree stuff
map <leader>n :NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeHijackNetrw = 0

let g:go_disable_autoinstall = 1

" format the entire file
nmap <leader>fef :normal! gg=G``<CR>

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](tmp|build|node_modules|target|dist|bower_components)|(\.(tmp|swp|ico|git|svn))$'

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" TagBar
nmap <leader>m :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
