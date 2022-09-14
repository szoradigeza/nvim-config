    " Add your own customizations in ~/.vim_runtime/my_configs.vim

    set foldlevelstart=99
    let g:loaded_matchparen        = 1
    let g:loaded_matchit           = 1
    let g:loaded_logiPat           = 1
    let g:loaded_rrhelper          = 1
    let g:loaded_tarPlugin         = 1
    " let g:loaded_man               = 1
    let g:loaded_gzip              = 1
    let g:loaded_zipPlugin         = 1
    let g:loaded_2html_plugin      = 1
    let g:loaded_shada_plugin      = 1
    let g:loaded_spellfile_plugin  = 1
    let g:loaded_netrw             = 1
    let g:loaded_netrwPlugin       = 1
    let g:loaded_tutor_mode_plugin = 1
    let g:loaded_remote_plugins    = 1 
  
    let g:winresizer_start_key = '<C-m>'

    set colorcolumn=0
    set nocursorcolumn
    set nocursorline

    set synmaxcol=200
    set lazyredraw

    " Change foldmethod for specific filetype
    au! BufNewFile,BufRead *.json set foldmethod=indent

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
    set relativenumber
    filetype plugin indent on   "allow auto-indenting depending on file type
    syntax on                   " syntax highlighting
    set mouse=a                 " enable mouse click
    set clipboard=unnamedplus   " using system clipboard
    filetype plugin on
    set cursorline              " highlight current cursorline 

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1



    runtime ./coc.maps.vim

    call plug#begin(stdpath('data') . '/plugged')

    "------------------------ Python ------------------------




        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp' 
          Plug 'hrsh7th/cmp-nvim-lsp'
            Plug 'saadparwaiz1/cmp_luasnip'
Plug 'MunifTanjim/eslint.nvim'
          Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*'}


          Plug 'jose-elias-alvarez/null-ls.nvim'
        Plug 'MunifTanjim/prettier.nvim'

        Plug 'xiyaowong/nvim-transparent'
        Plug 'SirVer/ultisnips'
        Plug 'mlaursen/vim-react-snippets'
        Plug 'simeji/winresizer'
        Plug 'tpope/vim-fugitive'
        Plug 'lukas-reineke/indent-blankline.nvim'
        Plug 'ray-x/lsp_signature.nvim'





    "------------------------ VIM TSX ------------------------
    " by default, if you open tsx file, neovim does not show syntax colors
    " vim-tsx will do all the coloring for jsx in the .tsx file
      "  Plug 'ianks/vim-tsx'
    "------------------------ VIM TSX ------------------------
    " by default, if you open tsx file, neovim does not show syntax colors
    " typescript-vim will do all the coloring for typescript keywords
      "  Plug 'leafgarland/typescript-vim'
      "  Plug 'othree/yajs.vim'
     "   Plug 'pangloss/vim-javascript'

    "------------------------ THEME ------------------------
    "
    " most importantly you need a good color scheme to write good code :D
 "      Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"        Plug 'EdenEast/Nightfox.nvim' " Vim-Plug
        Plug 'bluz71/vim-nightfly-guicolors'

        Plug 'nvim-lua/plenary.nvim'
        Plug 'sindrets/diffview.nvim'

        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }


     
        Plug 'max397574/better-escape.nvim'

        Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
        Plug 'kyazdani42/nvim-tree.lua'
  "      Plug 'SirVer/ultisnips'
   "     Plug 'honza/vim-snippets'
        
        Plug 'nvim-lualine/lualine.nvim'


        Plug 'preservim/nerdcommenter'
    "   Plug 'mhinz/vim-startify'
        Plug 'romgrk/barbar.nvim'
    "    Plug 'dense-analysis/ale'
        "Plug 'sbdchd/neoforymat'

        Plug 'ibhagwan/fzf-lua', {'branch': 'main'}

        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
        Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

        Plug 'folke/which-key.nvim'
        Plug 'camspiers/lens.vim'
        Plug 'TimUntersberger/neogit'
        Plug 'karb94/neoscroll.nvim'
        Plug 'tversteeg/registers.nvim', { 'branch': 'main' }




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
       defaults = { file_ignore_patterns = {"node_modules"} },
    buffer_previewer_maker = new_maker,
  }
}


require('telescope').load_extension('fzf')

local neogit = require('neogit')

neogit.setup {
    disable_commit_confirmation = true,

    integrations= {
          diffview= true  
          }
      }

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
  
}


require('neoscroll').setup({
    easing_function = "quadratic" -- Default easing function
    -- Set any other options as needed
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- Use the "sine" easing function
t['<C-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '350', [['sine']]}}
t['<C-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '350', [['sine']]}}





require('neoscroll.config').set_mappings(t)



EOF

map <C-u> <Nop>
map <C-d> <Nop>
map <C-b> <Nop>
map <C-f> <Nop>
map <C-y> <Nop>
map <C-e> <Nop>
map <C-e> <Nop>
map zz <Nop>
map zt <Nop>
map zb <Nop>






