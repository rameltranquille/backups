-- This is an example chadrc file , its supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onedark",
}

M.options = {
   close_buffer = "<leader>x",
   copy_whole_file = "<C-a>",
   cmdheight = 1,
   numberwidth = 2,
   shiftwidth = 4,
   smartindent = true,
   tabstop = 4,
   theme = "onedark",
   relativenumber = true,
  
   terminal = {
     esc_termmode = {"jk"},
     esc_hide_termmode = {"JK"},
     pick_term = "<leader>W",
     new_horizontal = "<leader>h",
     new_vertical = "<leader>v",
     new_window = {"<leader>w", "<leader>sh"},
     
     
   }

   
 }
 
local userPlugins = require "custom.plugins" -- path to table

M.plugins = {
    install = userPlugins,
}
 
return M
