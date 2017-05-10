" =============="
" dein settings "
" =============="
if &compatible
    set nocompatible
endif

" set paths for dein
let s:dein_path           = $HOME       . '/.vim/dein'
let s:dein_repo_path      = s:dein_path . '/repos/github.com/Shougo/dein.vim'
let s:dein_toml_path      = $HOME       . '/.vim/dein.toml'
let s:dein_lazy_toml_path = $HOME       . '/.vim/dein_lazy.toml'

" install dein.vim if not exists
if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
endif

" set runtimepath
set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

" load plugin
if dein#load_state(s:dein_path)
    call dein#begin(s:dein_path)
    call dein#load_toml(s:dein_toml_path,      {'lazy':0})
    call dein#load_toml(s:dein_lazy_toml_path, {'lazy':1})
    call dein#end()
endif

" if you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Spaces, Tabs & Backspace
set tabstop=4 " number of visual spaces per TAB
set expandtab " tabs are spaces
set backspace=indent,eol,start

" UI Config
set number " show line numbers
set ruler  " show ruler
set cursorline
set cursorcolumn

if has("mouse")
  set mouse=a
  set ttymouse=xterm2
endif

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Copy
set clipboard+=unnamed
set clipboard+=autoselect

" =============================== "
" bronson/vim-trailing-whitespace "
" =============================== "
autocmd BufWritePre * :FixWhitespace

" ======================= "
"  itchyny/lightline.vim  "
" ======================= "
" set laststatus=2
" let g:lightline = {
"       \ 'colorscheme': 'hybrid'
"       \ }

" =============== "
" jalvesaq/Nvim-R "
" =============== "
let R_setwidth = 0
let R_in_buffer = 0
let R_assign = 0
let R_applescript = 0
let R_tmux_split = 1
let R_show_args = 1
let R_args_in_stline = 1
let R_esc_term = 0
let R_objbr_place = "console,left"
let R_rconsole_width = 0

" ====================== "
" Shougo/neocomplete.vim "
" ====================== "

" Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME . '/.vimshell_hist',
    \ 'scheme' : $HOME . '/.gosh_completions'
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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ============================= "
" vim-airline/vim-airline       "
" vim-airline/vim-airline-theme "
" ============================= "
set laststatus=2
set statusline=2
set showtabline=2
let g:airline_theme = "hybrid"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

" =============== "
" w0ng/vim-hybrid "
" =============== "
syntax on
set background=dark
" colorscheme hybrid
colorscheme hybrid_material
let g:hybrid_custom_term_colors = 1
highlight LineNr ctermfg=242
highlight CursorLineNr ctermbg=4 ctermfg=255

filetype plugin indent on
