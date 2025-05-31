-- Key mappings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)

-- Normal mode mappings
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- === VISUAL BLOCK MODE ENHANCEMENTS ===

-- Visual Block mode shortcuts
keymap("n", "<leader>vb", "<C-v>", { noremap = true, silent = true, desc = "Enter Visual Block mode" })

-- Block commenting (works with Visual Block selection)
keymap("x", "<leader>cc", "I// <Esc>", { noremap = true, silent = true, desc = "Comment block (// style)" })
keymap("x", "<leader>ch", "I# <Esc>", { noremap = true, silent = true, desc = "Comment block (# style)" })
keymap("x", "<leader>cl", "I-- <Esc>", { noremap = true, silent = true, desc = "Comment block (-- style)" })

-- Block uncommenting
keymap("x", "<leader>cu", ":s/^\\(\\s*\\)\\(//\\|#\\|--\\) /\\1/<CR>:nohlsearch<CR>", { noremap = true, silent = true, desc = "Uncomment block" })

-- Block indentation with Visual Block
keymap("x", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent block" })
keymap("x", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Unindent block" })

-- Block operations
keymap("x", "<leader>bd", "d", { noremap = true, silent = true, desc = "Delete block" })
keymap("x", "<leader>by", "y", { noremap = true, silent = true, desc = "Yank block" })
keymap("x", "<leader>bp", "p", { noremap = true, silent = true, desc = "Paste block" })

-- Block text transformations
keymap("x", "<leader>bu", "U", { noremap = true, silent = true, desc = "Uppercase block" })
keymap("x", "<leader>bl", "u", { noremap = true, silent = true, desc = "Lowercase block" })

-- Block numbering (incremental)
keymap("x", "<leader>bn", "g<C-a>", { noremap = true, silent = true, desc = "Number lines incrementally" })

-- Block alignment shortcuts
keymap("x", "<leader>ba", ":s/\\%V.*\\%V./", { noremap = true, desc = "Align block (enter replacement)" })

-- Block surround operations
keymap("x", '<leader>b"', 'c"<C-r>""<Esc>', { noremap = true, silent = true, desc = "Surround block with quotes" })
keymap("x", "<leader>b'", "c'<C-r>\"'<Esc>", { noremap = true, silent = true, desc = "Surround block with single quotes" })
keymap("x", "<leader>b(", "c(<C-r>\")<Esc>", { noremap = true, silent = true, desc = "Surround block with parentheses" })
keymap("x", "<leader>b[", "c[<C-r>\"]<Esc>", { noremap = true, silent = true, desc = "Surround block with brackets" })
keymap("x", "<leader>b{", "c{<C-r>\"}<Esc>", { noremap = true, silent = true, desc = "Surround block with braces" })

-- Column editing helpers
keymap("n", "<leader>vc", "<C-v>$", { noremap = true, silent = true, desc = "Select to end of line (column mode)" })
keymap("n", "<leader>va", "<C-v>G", { noremap = true, silent = true, desc = "Select to end of file (column mode)" })

-- Quick column operations
keymap("n", "<leader>vi", "<C-v>I", { noremap = true, silent = true, desc = "Insert at beginning of column" })
keymap("n", "<leader>va", "<C-v>A", { noremap = true, silent = true, desc = "Append at end of column" })

-- File Explorer
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Terminal
keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)

-- Save file
keymap("n", "<C-s>", ":w<CR>", opts)

-- Quit
keymap("n", "<leader>q", ":qa<CR>", opts)
