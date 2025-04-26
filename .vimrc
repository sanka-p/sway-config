"  __  ____  ____  __  __   __ _  ____
" /  \(  _ \(_  _)(  )/  \ (  ( \/ ___)
"(  O )) __/  )(   )((  O )/    /\___ \
" \__/(__)   (__) (__)\__/ \_)__)(____/

"enables intelligent auto-indenting
if has('filetype')
  filetype plugin indent on
endif

"auto read when a file is changed from outside
set autoread
au FocusGained,BufEnter * checktime

"enable syntax highlighting
if has('syntax')
  syntax enable
endif

set termguicolors
set nobackup
set nowritebackup
set colorcolumn=100
set encoding=utf-8
set updatetime=300 "time vim waits after last keypress to trigger plugin, setting this too low might cause glitches
set signcolumn=yes
set history=1000 "number of previous commands vim remembers
set tabstop=2 "whitespaces a \t char is worth
set shiftwidth=2 "whitespaces an indent level is worth
set softtabstop=2 "whitespaces a tab keypress gives 
set expandtab "always show whitespace and not \t
set autoindent "keep new line in the same indent level as previous line
set smartindent
set number relativenumber "set hybrid line numbers
set noerrorbells novisualbell t_vb= tm=500 "remove the annoying beeping
set hidden "enable opening new buffers w/out saving the current one
set wildmenu "better command-line completion
set showcmd "show partial commands in the last line of the screen
set cmdheight=1 "height of command bar
set hlsearch "search highlighting
set incsearch "move the highlight as you add characters to search string
set lazyredraw "screen will not be redrawn when executing macros (better performance)
set showmatch "show matching brackets when cursor is over them
set scrolloff=5 "set number of context lines to display below and above cursor
set ignorecase smartcase "use case insensitive search, except when using capitals 
set backspace=indent,eol,start "allow backspacing over indents, eol
set whichwrap+=<,>,h,l,[,] "move to prevoius/next line after reaching start/end of current line
set nostartofline "stop certain movements from always going to the first character of a line.
set ruler "show cursor cell position in status line
set laststatus=2 "slways show status line
set confirm "ask to save instead of failing the command
set notimeout ttimeout ttimeoutlen=200 "quickly time out on keycodes, but never time out on mappings

let g:loaded_netrwPlugin = 1 "disable default file explorer in favor of nerdtree

" __ _  ____  _  _  ____  __  __ _  ____  ____ 
"(  / )(  __)( \/ )(  _ \(  )(  ( \(    \/ ___)
" )  (  ) _)  )  /  ) _ ( )( /    / ) D (\___ \
"(__\_)(____)(__/  (____/(__)\_)__)(____/(____/

let mapleader = "\<Space>"

nnoremap <leader>fe :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeFind<CR>

" Line moving
" In normal or insert mode, press Alt-j or Alt-k to move the current line down or up
" Similarly move blocks of code in visual mode after selecting it
nnoremap <Esc>j :m .+1<CR>==
nnoremap <Esc>k :m .-2<CR>==
inoremap <Esc>j <Esc>:m .+1<CR>==gi
inoremap <Esc>k <Esc>:m .-2<CR>==gi
vnoremap <Esc>j :m '>+1<CR>gv=gv
vnoremap <Esc>k :m '<-2<CR>gv=gv

" ____  __    _  _   ___  __  __ _  ____ 
"(  _ \(  )  / )( \ / __)(  )(  ( \/ ___)
" ) __// (_/\) \/ (( (_ \ )( /    /\___ \
"(__)  \____/\____/ \___/(__)\_)__)(____/

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin(expand('~/.vim/plugged'))
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
call plug#end()

colorscheme catppuccin_mocha
