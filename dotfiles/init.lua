-- This is where you custom modules and plugins goes.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

-------------------------------------------------------------------
--
-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:


hooks.add("setup_mappings", function(map)
    map("i", "jj", "<Esc>", opt) -- example to delete the buffer
    -- map("n", "f", "za", opt) 
    map("n", "<leader>,", ";", opt) 
    map("n", ";", ":", opt) 
    map("n", "gcc", ":CommentToggle<CR>")
    map("n", "<leader>lo", ":VimtexCompile<CR>")
    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-j>", "<C-w>j")
    map("n", "<C-k>", "<C-w>k")
    map("", "<C-l>", "<C-w>l")

    map("n", "<leader>a", "ea")
    -- MD Related
    map("n", "<leader>mt", ":TableFormat<CR>")
    map("n", "<leader>mb", "i****<ESC>hi")
    map("n", "<leader>mi", "i**<ESC>i")
    map("n", "<leader>mtc", ":InsertToc 3<CR>")
    map("n", "<leader>mp", ":MarkdownPreview<CR>")
    -- executing programs in the terminal
    map("n", "<leader>rp", ":terminal python3 %<CR>i")
    map("n", "<leader>rj", ":terminal java %<CR>i")
    map("n", "<leader>rt", ":split | new +terminal java temp.java<CR>i")
 end)


-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:


-- PLUGINS LIST
-- BETTER-ESC
-- WHICKEY
hooks.add("install_plugins", function(use)
  use {
     "folke/which-key.nvim",
     config = function()
         require("which-key").setup {
             plugins = {
                 spelling = {
                     enabled = false,
                     suggestions = 10,
                 }
             }
         }
 end
   }
end)



hooks.add("install_plugins", function(use)
    use {"jdhao/better-escape.vim",
        event = "InsertEnter"
    }
end)

hooks.add("install_plugins", function(use)
    use "tpope/vim-repeat"
end)

hooks.add("install_plugins", function(use)
    use {"lervag/vimtex", ft = 'tex'}
end)

hooks.add("install_plugins", function(use)
    use {"plasticboy/vim-markdown",
        ft = "markdown"}
end)

hooks.add("install_plugins", function(use)
    use {"iamcco/markdown-preview.nvim", 
        after = 'vim-markdown'} 
end)

hooks.add("install_plugins", function(use)
    use {"godlygeek/tabular",
        after = "vim-markdown",
        event = "BufRead"}
end)

hooks.add("install_plugins", function(use)
    use {"chrisbra/Colorizer",
        cmd = "ColorHighlight"}
end)


vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = " "
vim.g.nvim_tree_disble_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
-- OPTIONS
-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with
-- require "custom.plugins.mkdir"
