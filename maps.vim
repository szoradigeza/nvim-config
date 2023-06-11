
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

nmap svf :noa w <Return>

let mapleader = " " " map leader to Space
map <leader>t :NvimTreeFocus<CR>
map <leader>tt :NvimTreeFindFile<CR>





map  <silent>  <C-P>  <cmd>Telescope find_files hidden=true<CR>
map  <silent>  <C-o> <cmd>Telescope live_grep hidden=true<cr>
"nnoremap <silent>  <C-P> :lua require'telescope.builtin'.find_files({hidden=true})<CR>
"nnoremap <silent>  <C-o> :lua "require'telescope.builtin'.live_grep({hidden=true})  <CR>



map  <silent>  <leader>G <cmd>Neogit<cr>
map  <silent>  <leader>b <cmd>Telescope buffers<cr>
map  <silent>  <leader>\ <cmd>BufferCloseAllButCurrent<CR>
map  <silent>  <leader>th <cmd>Telescope help_tags<cr>
nmap  <silent>  <leader>s <cmd>vsplit<cr>

"nmap <C-k> <C-y>
"nmap <C-j> <C-e>


map <silent> <C-s> <cmd>:w <cr>
map  <silent>  <esc> :noh <CR>


"GIT maps



"Barbar
nnoremap <silent> <C-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-.>  <Cmd>BufferNext<CR>
" Re-order to previous/next

" Goto buffer in position...
nnoremap <silent>    <leader>1 <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <leader>2 <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <leader>3 <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <leader>4 <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <leader>5 <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <leader>6 <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <leader>7 <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <leader>8 <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <leader>9 <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <leader>0 <Cmd>BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <f-p> <Cmd>BufferPin<CR>
" Close buffer
nnoremap <silent>    <f-c> <Cmd>BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight
" Sort automatically by...
"nnoremap <silent> <Space>bo <Cmd>BufferOrderByBufferNumber<CR>
"nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
"nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
"nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>





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
