" Add your own customizations in ~/.vim_runtime/my_configs.vim

set runtimepath+=~/.vim_runtime
set termguicolors

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

let $NVIM_TUI_ENABLE_TRUE_COLOR=1



runtime ./coc.maps.vim

call plug#begin(stdpath('data') . '/plugged')

"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc extensions

"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" vim-tsx will do all the coloring for jsx in the .tsx file
Plug 'ianks/vim-tsx'
"------------------------ VIM TSX ------------------------
" by default, if you open tsx file, neovim does not show syntax colors
" typescript-vim will do all the coloring for typescript keywords
Plug 'leafgarland/typescript-vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'

"------------------------ THEME ------------------------
" most importantly you need a good color scheme to write good code :D
"   Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'EdenEast/Nightfox.nvim' " Vim-Plug
    Plug 'bluz71/vim-nightfly-guicolors'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'sindrets/diffview.nvim'

    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


 
    
    Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'ojroques/nvim-hardline'


    Plug 'preservim/nerdcommenter'
"    Plug 'mhinz/vim-startify'
    Plug 'romgrk/barbar.nvim'
    Plug 'dense-analysis/ale'
    Plug 'sbdchd/neoformat'

    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


call plug#end()



runtime ./maps.vim





lua << EOF
    vim.cmd('colorscheme nightfly')

local previewers = require('telescope.previewers')

local _bad = { '.*%.csv', '.*%.lua' } -- Put all filetypes that slow you down in this array
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return false
    end
  end

  return true
end

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

require('telescope').setup {
  defaults = {
    buffer_previewer_maker = new_maker,
  }
}


require('telescope').load_extension('fzf')



EOF












