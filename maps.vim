
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

let mapleader = " " " map leader to Space
map <leader>t :NvimTreeFocus<CR>
map <leader>tt :NvimTreeFindFile<CR>





map <C-P>  <cmd>Telescope find_files<CR>
map <C-o> <cmd>Telescope live_grep<cr>
map <leader>fb <cmd>Telescope buffers<cr>
map <leader>fh <cmd>Telescope help_tags<cr>
map <leader>s <cmd>vsplit<cr>

map <C-s> <cmd>:w <cr>
map <esc> :noh <CR>



if &wildoptions =~ "pum"
    cnoremap <expr> <up> pumvisible() ? "<C-p>" : "\\<up>"
    cnoremap <expr> <down> pumvisible() ? "<C-n>" : "\\<down>"
endif

lua << EOF







--  Mapping --
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "typescript", "javascript"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF
