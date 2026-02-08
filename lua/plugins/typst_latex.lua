-- Typst + LaTeX support
return {
  -- LaTeX (VimTeX)
  {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "latex" },
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_quickfix_enabled = 1
      vim.g.vimtex_fold_enabled = 1
    end,
  },

  -- Typst syntax + filetype
  {
    "kaarmu/typst.vim",
    ft = { "typst" },
  },

  -- Typst live preview
  {
    "chomosuke/typst-preview.nvim",
    ft = { "typst" },
    config = function()
      require("typst-preview").setup({})
    end,
  },
}
