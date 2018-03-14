call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'neomake/neomake'
Plug 'chriskempson/base16-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'
Plug 'hashivim/vim-terraform'
Plug 'airblade/vim-gitgutter'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mxw/vim-jsx'
Plug 'zchee/deoplete-jedi'
Plug 'editorconfig/editorconfig-vim'
Plug 'jodosha/vim-godebug'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
Plug 'itchyny/lightline.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'leafgarland/typescript-vim'

call plug#end()

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set autoread
set noshowmode
set textwidth=100
set colorcolumn=+1
set encoding=utf-8
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=""
set listchars=tab:▸\ ,eol:¬
set listchars+=trail:.
set listchars+=extends:>
set listchars+=precedes:<
set completeopt-=preview
set noswapfile
set completeopt+=noinsert
set completeopt+=noselect
set hlsearch
set ignorecase
set smartcase
set mouse=a

hi Normal guibg=NONE ctermbg=NONE

let mapleader=','
let maplocalleader=';'
nmap <leader>fef :normal! gg=G``<CR>

autocmd TermOpen * if &buftype == 'terminal' | :set nolist | endif

" AutoPkg recipe files
au BufNewFile,BufRead *.recipe set ft=xml
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Remember last location in file, but not for commit messages.
" see :help last-position-jump
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif

" NERDTree stuff
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Vim GO
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_term_mode = "split"

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

" Terraform
let g:terraform_fmt_on_save = 1

" Buffergator
let g:buffergator_viewport_split_policy='B'
let g:buffergator_hsplit_size=5
nnoremap <silent> <Leader>g :BuffergatorOpen<CR>

" Deoplete
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer']
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete'
      \]

" Neoformat
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_sql = []

augroup NeoformatAutoFormat
  autocmd!

  autocmd FileType javascript,javascript.jsx,typescript setlocal formatprg=prettier
  autocmd BufWritePre * Neoformat
augroup END

" Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

" jsx
let g:jsx_ext_required = 0

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Language server
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
