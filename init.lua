-- Neovim Configuration
-- Main entry point

-- Set leader key early
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Load plugin manager and plugins
require("config.lazy")
