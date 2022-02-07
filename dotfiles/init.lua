local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
    use {"ThePrimeagen/vim-be-good", cmd = 'VimBeGood'}
end)

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
    use {
        'iamcco/markdown-preview.nvim',
        ft = {'markdown'},
        run = 'cd app && yarn install'

    }
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


--==========================================
-- Settings
--==========================================
vim.g.nv_search_paths = {'~/Dropbox/workbench', '~/Dropbox/foundations', '~/Dropbox/orgComm', '~/Dropbox/AsianEcon', '~/Dropbox/DS'}
vim.g.nv_default_extension = '.md'
vim.g.vimwiki_list = {
          {path='/home/ramel/Dropbox/workbench/',ext='.md',syntax='markdown', index='home'}, 
          {path='/home/ramel/Dropbox/foundations/',ext='.md',syntax='markdown', index='benchF'}, 
          {path='/home/ramel/Dropbox/AsianEcon/',ext='.md',syntax='markdown', index='benchA'}, 
          {path='/home/ramel/Dropbox/orgComm/',ext='.md',syntax='markdown', index='benchOC'}, 
          {path='/home/ramel/Dropbox/DS/',ext='.md',syntax='markdown', index='benchDS'}, 
      } 
     
vim.g.zettel_format = "%y%m%d-%H%M-%title"

    
vim.g.vim_markdown_folding_disabled = 1
vim.g.mkdp_auto_start = 1
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_math = 1
vim.opt.conceallevel = 2
vim.g.vimtex_view_method = 'zathura'
vim.g.maplocalleader = " "
vim.g.vimwiki_global_ext = 0




