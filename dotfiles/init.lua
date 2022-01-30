local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    use {"lervag/vimtex", ft = 'tex'}
end)

customPlugins.add(function(use)
    use {
        "vimwiki/vimwiki", 
        cmd = "VimwikiIndex"
    }
end)

customPlugins.add(function(use)
    use {
      "michal-h21/vim-zettel",
        ft = "markdown",
        after = "vimwiki"
      }
end)

customPlugins.add(function(use)
    use {
      "alok/notational-fzf-vim",
        after = "vimwiki"
      }
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

--==========================================
-- Mappings
--==========================================
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
-- map("n", "<leader>mt", ":TableFormat<CR>")
-- map("n", "<leader>mb", "i****<ESC>hi")
-- map("n", "<leader>mi", "i**<ESC>i")
map("n", "<leader>mtc", ":InsertToc 3<CR>")
map("n", "<leader>mp", ":MarkdownPreview<CR>")
-- executing programs in the terminal
map("n", "<leader>rp", ":terminal python3 %<CR>i")
map("n", "<leader>rj", ":terminal java %<CR>i")
map("n", "<leader>rt", ":split | new +terminal java temp.java<CR>i")

map("n", "<silent> <leader>nv", ":NV<CR>")
map("n", "<leader>zn", ":ZettleNew<CR>")
map("n", "<leader>zo", ":ZettleOpen<CR>")
map("n", "<leader>zc", ":ZettleCapture<CR>")
map("n", "<leader>zs", ":ZettleSearch<CR>")
map("n", "<leader>wc", ":VimwikiToggleListItem<CR>")


-- function VimwikiFindIncompleteTasks()
    -- lvimgrep=/- \[ \]/ %=p
    -- lopen
-- end


-- function VimwikiFindAllInompleteTasks()
    -- VimwikiSearch /- \[ \]/
    -- lopen
-- end

-- map("n", "<leader>wa", ":call VimwikiFindIncompleteTasks<CR>")
-- map("n", "<leader>wx", ":call VimwikiFindAllInompleteTasks<CR>")


--==========================================
-- Settings
--==========================================
vim.g.nv_search_paths = {'~/Dropbox/Notebook', '~/Dropbox/foundations', '~/Dropbox/orgComm', '~/Dropbox/Calc2', '~/Dropbox/DS'}
vim.g.nv_default_extension = '.md'
vim.g.vimwiki_list = {
         {path='~/Dropbox/workbench/',ext='.md',syntax='markdown'}, 
         {path='~/Dropbox/foundations/',ext='.md',syntax='markdown'}, 
         {path='~/Dropbox/Calc2/',ext='.md',syntax='markdown'}, 
         {path='~/Dropbox/orgComm/',ext='.md',syntax='markdown'}, 
         {path='~/Dropbox/DS/',ext='.md',syntax='markdown'} 
     }
vim.g.zettel_format = "%y%m%d-%H%M-%title"

    
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = " "
-- vim.g.nvim_tree_disble_netrw = 0
-- vim.g.nvim_tree_hijack_netrw = 0



