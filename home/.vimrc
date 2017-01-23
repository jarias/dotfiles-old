call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jsx/jsx.vim'

call plug#end()

set t_Co=256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set guifont=Hack\ 14
set nocompatible      " Use vim, no vi defaults
set autoread
set textwidth=100
set colorcolumn=+1
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set number         "Show line numbers
set encoding=utf-8 "Set default encoding to UTF-8
set nowrap         "don't wrap lines
set tabstop=2      "a tab is two spaces
set shiftwidth=2   "an autoindent (with <<) is two spaces
set expandtab      "use spaces, not tabs
set list           "Show invisible characters
set listchars=""
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set laststatus=2
set completeopt-=preview
set ttimeoutlen=10
""
"" Mappings
""
let mapleader=','
nmap <leader>fef :normal! gg=G``<CR>

""
"" Searching
""

set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

au BufNewFile,BufRead *.recipe set ft=xml

" Javascript
au FileType javascript setlocal ts=2 sw=2 sts=2
autocmd bufwritepost *.js silent !standard --fix %

" HTML
au FileType html setlocal ts=4 sw=4 sts=4

" CSS or SCSS
au FileType css setlocal ts=4 sw=4 sts=4

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

""
"" NERDTree stuff
""
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

""
"" Vim GO
""
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

nnoremap <leader>nn :cnext<CR>
nnoremap <leader>mm :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)

""
"" Neocomplete
""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""
"" Terraform
""
let g:terraform_fmt_on_save = 1

""
"" CtrlP
""
let g:ctrlp_custom_ignore = '\v[\/](tmp|build|node_modules|target|dist|bower_components)|(\.(tmp|swp|ico|git|svn))$'

""
"" TagBar
""
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

""
"" Syntastic
""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']

""
"" Buffergator
""
let g:buffergator_viewport_split_policy='B'
let g:buffergator_hsplit_size=5
nnoremap <silent> <Leader>g :BuffergatorOpen<CR>

""
"" Autoformat
""
au BufWrite *.py :Autoformat

""
"" Airline
""
let g:airline_powerline_fonts = 1
