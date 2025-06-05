-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
  end,
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.fn.setpos(".", vim.fn.getpos("'\""))
      vim.cmd("silent! foldopen")
    end
  end,
})

-- Auto-format on save for certain filetypes
autocmd("BufWritePre", {
  pattern = { "*.lua", "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.md" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- === VISUAL BLOCK MODE HELPERS ===

-- Create namespace for block mode highlights
local block_ns = vim.api.nvim_create_namespace("visual_block_helpers")

-- Enhanced Visual Block Mode autocmds
augroup("VisualBlockEnhancement", { clear = true })

-- Highlight block selections differently
autocmd("ModeChanged", {
  group = "VisualBlockEnhancement",
  pattern = "*:v-b",
  callback = function()
    vim.api.nvim_echo({{"Entering Visual Block Mode", "MoreMsg"}}, false, {})
  end,
})

autocmd("ModeChanged", {
  group = "VisualBlockEnhancement", 
  pattern = "v-b:*",
  callback = function()
    vim.api.nvim_echo({{"Exiting Visual Block Mode", "WarningMsg"}}, false, {})
  end,
})

-- Block operation functions
_G.block_operations = {
  -- Add line numbers to visual block selection
  number_lines = function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    for i = start_line, end_line do
      local line_content = vim.api.nvim_buf_get_lines(0, i-1, i, false)[1]
      local line_num = i - start_line + 1
      vim.api.nvim_buf_set_lines(0, i-1, i, false, {line_num .. ". " .. line_content})
    end
  end,

  -- Remove line numbers from visual block selection
  remove_numbers = function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    for i = start_line, end_line do
      local line_content = vim.api.nvim_buf_get_lines(0, i-1, i, false)[1]
      local clean_line = line_content:gsub("^%d+%. ", "")
      vim.api.nvim_buf_set_lines(0, i-1, i, false, {clean_line})
    end
  end,

  -- Box comment around visual block
  box_comment = function()
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")
    local start_col = vim.fn.col("'<")
    local end_col = vim.fn.col("'>")
    local width = end_col - start_col + 1
    
    local border = string.rep("*", width + 4)
    vim.api.nvim_buf_set_lines(0, start_line-1, start_line-1, false, {"/* " .. border .. " */"})
    vim.api.nvim_buf_set_lines(0, end_line+1, end_line+1, false, {"/* " .. border .. " */"})
  end,
}

-- Visual Block mode keybindings for functions (use different keys to avoid conflicts)
vim.keymap.set("x", "<leader>bN", ":lua block_operations.number_lines()<CR>", { noremap = true, silent = true, desc = "Number lines in block" })
vim.keymap.set("x", "<leader>br", ":lua block_operations.remove_numbers()<CR>", { noremap = true, silent = true, desc = "Remove line numbers" })
vim.keymap.set("x", "<leader>bb", ":lua block_operations.box_comment()<CR>", { noremap = true, silent = true, desc = "Box comment around block" })
