
syntax on

set noerrorbells
set number
set relativenumber
set autoindent
set tabstop=2
set smarttab
set mouse=a
set wildmenu
set autoread
set autowrite
set noexpandtab
set shiftwidth=2
set smartindent
set noswapfile
set incsearch

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/seoul256.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tc50cal/vim-terminal'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mattn/emmet-vim'

call plug#end()

colo seoul256

nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-t> :TerminalSplit bash<CR>
nnoremap <C-f> <cmd>Telescope find_files<cr>

let g:user_emmet_leader_key=','
autocmd VimEnter * :NERDTreeToggle
