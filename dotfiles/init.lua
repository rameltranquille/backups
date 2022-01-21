local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
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

customPlugins.add(function(use)
    use {"jdhao/better-escape.vim",
        event = "InsertEnter"
    }
end)

customPlugins.add(function(use)
    use "terrortylor/nvim-comment",
        require('nvim_comment').setup({
            create_mappings = true,
            comment_empty = false,
            line_mapping = "gcc",
            operator_mapping = "gc",
            hook = nil,
        })
end)

customPlugins.add(function(use)
    use "tpope/vim-repeat"
end)

customPlugins.add(function(use)
    use {"lervag/vimtex", ft = 'tex'}
end)

customPlugins.add(function(use)
    use {"plasticboy/vim-markdown",
        ft = "markdown"}
end)

customPlugins.add(function(use)
    use {"iamcco/markdown-preview.nvim", 
        after = 'vim-markdown'} 
end)

customPlugins.add(function(use)
    use {"godlygeek/tabular",
        after = "vim-markdown",
        event = "BufRead"}
end)
customPlugins.add(function(use)
    use {"chrisbra/Colorizer",
        cmd = "ColorHighlight"}
end)


local map = require("core.utils").map

map("i", "jj", "<Esc>", opt)
-- map("n", "f", "za", opt) 
map("n", "<leader>,", ";", opt) 
map("n", ";", ":", opt) 
map("n", "gcc", ":CommentToggle<CR>")
map("n", "<leader>cc", ":CommentToggle<CR>")
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



vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = " "
-- vim.g.nvim_tree_disble_netrw = 0
-- vim.g.nvim_tree_hijack_netrw = 0
