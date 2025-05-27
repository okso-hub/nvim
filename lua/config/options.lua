-- Core Neovim options
local opt = vim.opt

-- General
opt.mouse = "a"                             -- Enable mouse support
opt.clipboard = "unnamedplus"               -- Use system clipboard
opt.swapfile = false                        -- Disable swap files
opt.backup = false                          -- Disable backup files
opt.writebackup = false                     -- Disable backup before overwriting
opt.completeopt = "menuone,noselect"        -- Better completion experience
opt.conceallevel = 0                        -- Show `` in markdown files
opt.fileencoding = "utf-8"                  -- File encoding
opt.pumheight = 10                          -- Popup menu height
opt.showmode = false                        -- Don't show mode in command line
opt.showtabline = 2                         -- Always show tabs
opt.smartcase = true                        -- Smart case for searching
opt.smartindent = true                      -- Smart indentation
opt.splitbelow = true                       -- Horizontal splits go below
opt.splitright = true                       -- Vertical splits go right
opt.termguicolors = true                    -- Enable 24-bit RGB colors
opt.timeoutlen = 1000                       -- Time to wait for mapped sequence
opt.undofile = true                         -- Enable persistent undo
opt.updatetime = 300                        -- Faster completion
opt.expandtab = true                        -- Convert tabs to spaces
opt.shiftwidth = 2                          -- Number of spaces for indentation
opt.tabstop = 2                             -- Number of spaces for tab
opt.cursorline = true                       -- Highlight current line
opt.number = true                           -- Show line numbers
opt.relativenumber = true                   -- Show relative line numbers
opt.numberwidth = 4                         -- Set width of line numbers
opt.signcolumn = "yes"                      -- Always show sign column
opt.wrap = false                            -- Don't wrap lines
opt.scrolloff = 8                           -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8                       -- Keep 8 columns left/right of cursor
opt.guifont = "monospace:h17"               -- Font for GUI
opt.fillchars.eob = " "                     -- Remove ~ from empty lines
opt.shortmess:append "c"                    -- Don't give completion messages
opt.whichwrap:append("<,>,[,],h,l")         -- Keys that move to next/prev line
opt.iskeyword:append("-")                   -- Treat dash as part of word

-- Search settings
opt.hlsearch = true                         -- Highlight search results
opt.ignorecase = true                       -- Ignore case when searching
opt.smartcase = true                        -- Override ignorecase if search contains capitals
