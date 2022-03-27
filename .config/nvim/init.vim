
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'godlygeek/tabular'
Plug 'neomake/neomake'
Plug 'sbdchd/neoformat'

" Git gutter for Vim
Plug 'airblade/vim-gitgutter'

" Support for Julia
Plug 'JuliaEditorSupport/julia-vim'

" Formatting Julia Files
Plug 'kdheepak/JuliaFormatter.vim'

" Support for R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" Automatic pane resizing
Plug 'camspiers/lens.vim'

" Region zooming for Vim
Plug 'chrisbra/NrrwRgn'

" Deoplete Completion framework
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

" Tab naming powers
Plug 'gcmt/taboo.vim'


" Adds file type icons to Vim plugins
Plug 'ryanoasis/vim-devicons'

"Colours
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mechatroner/rainbow_csv'

call plug#end()

filetype plugin indent on

"""""""""""""""""""""""""""""                                                                                                                                           │~
" NERDTREE                                                                                                                                                              │~
"""""""""""""""""""""""""""""                                                                                                                                           │~
" Start NERDTree
  autocmd VimEnter * NERDTree
" Jump to the main window.
  autocmd VimEnter * wincmd p
  let g:NERDTreeWinPos = "right"

" remap search key
  nmap <silent> <leader>d <Plug>DashSearch<CR>
" remapping the basic :: send line
  nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
  vmap , <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
  vmap ,e <Plug>RESendSelection
" esc in insert mode
  inoremap kj <esc>

" esc in command mode
  cnoremap kj <C-C>
" Note: In command mode mappings to esc run the command for some odd
" historical vi compatibility reason. We use the alternate method of
" existing which is Ctrl-C

" remap buffer switching
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Change Leader and LocalLeader keys:
let maplocalleader = ','
let mapleader = ';'

" Use Ctrl+Space to do omnicompletion:
if has('nvim') || has('gui_running')
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" Press the space bar to send lines and selection to R:
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Python config
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Airline Fonts
let g:airline_powerline_fonts = 1

"Colour schemes
let g:airline_theme = 'nord'
syntax on
colorscheme nord 

" Looks
set number           "line number
set cursorline       "highlight the line of the cursor
set cursorcolumn     "highlight the column of the cursor
set nowrap           "no line wrapping
set background=dark
" change the color of chars over the width of 80 into blue
" (uncomment to enable it)
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                " PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""
"JULIA FORMATTER
"""""""""""""""""""""

let g:JuliaFormatter_options = {
        \ 'indent'                    : 4,
        \ 'margin'                    : 92,
        \ 'always_for_in'             : v:false,
        \ 'whitespace_typedefs'       : v:false,
        \ 'whitespace_ops_in_indices' : v:true,
        \ }



""""""""""""""""""""""""""""""
" VIM-GITGUTTER
""""""""""""""""""""""""""""""
set updatetime=250
let g:gitgutter_max_signs = 500
let g:gitgutter_override_sign_column_highlight = 0

highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4


