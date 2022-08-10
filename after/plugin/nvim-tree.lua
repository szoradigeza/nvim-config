


require("nvim-tree").setup({
    sort_by = "case_sensitive",
    
    open_on_setup = true,
    open_on_setup_file = false,
       -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
        open_on_tab = false,
        -- hijack the cursor in the tree to put it at the start of the filename
        hijack_cursor = true,
        -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
        update_cwd = true,
    view = {
       -- adaptive_size = true,
        hide_root_folder = true,
         width = 40,
            side = 'left',
       -- adaptive_size = true,
        mappings = {
        list = {
            { key = "u", action = "dir_up" },
             { key = "s", action = "vsplit" },
           
        },
        },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
  },
  git={
    ignore = false
  }
})




