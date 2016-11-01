execute pathogen#infect()

set nocompatible      " Use vim, no vi defaults
set clipboard=unnamedplus
set autoread

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""
"" Basic Setup
""
set number            " Show line numbers
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

set listchars=""
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<

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

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g`\"" | endif

let mapleader=','

" NERDTree stuff
map <leader>n :NERDTreeToggle<CR>

let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
nnoremap <leader>nn :cnext<CR>
nnoremap <leader>mm :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)

let g:neocomplete#enable_at_startup = 1
set completeopt+=menuone
set completeopt-=preview

" format the entire file
nmap <leader>fef :normal! gg=G``<CR>

let g:terraform_fmt_on_save = 1

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](tmp|build|node_modules|target|dist|bower_components)|(\.(tmp|swp|ico|git|svn))$'

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

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']

nnoremap <silent> <Leader>g :BuffergatorOpen<CR>
