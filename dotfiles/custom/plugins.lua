return {
    {"ThePrimeagen/vim-be-good", cmd = 'VimBeGood'},

    {"lervag/vimtex", ft = 'tex'},

    {"vimwiki/vimwiki", cmd = "VimwikiIndex"},

    {
      "michal-h21/vim-zettel",
        ft = "markdown",
        after = "vimwiki"
      },

    {   "alok/notational-fzf-vim", after = "vimwiki" },
        
    -- {   "plasticboy/vim-markdown", ft = "markdown" },
    {   "plasticboy/vim-markdown"  },
        
    -- {   'iamcco/markdown-preview.nvim', run = 'cd app && yarn install',
    --     ft = 'markdown'
    -- },

    {
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    ft = {'markdown'}
    },

    {   "godlygeek/tabular",
        after = "vim-markdown",
        event = "BufRead"
    },

    {"chrisbra/Colorizer", cmd = "ColorHighlight"},
}
