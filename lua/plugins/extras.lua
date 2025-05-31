-- Additional cool plugins
return {
  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1
        },
      })
    end,
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      })
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      })
    end,
  },

  -- Comment toggle
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Which key for keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        plugins = {
          marks = true,
          registers = true,
          spelling = {
            enabled = true,
            suggestions = 20,
          },
        },
        window = {
          border = "rounded",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 2, 2, 2, 2 },
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 3,
          align = "left",
        },
      })

      -- Visual Block mode mappings
      wk.register({
        ["<leader>b"] = {
          name = "📦 Block Operations",
          c = "Comment block (//))",
          h = "Comment block (#)",
          l = "Comment block (--)",
          u = "Uncomment block",
          d = "Delete block",
          y = "Yank block",
          p = "Paste block",
          u = "Uppercase block",
          l = "Lowercase block",
          n = "Number lines incrementally",
          a = "Align block",
          ['"'] = "Surround with quotes",
          ["'"] = "Surround with single quotes",
          ["("] = "Surround with parentheses",
          ["["] = "Surround with brackets",
          ["{"] = "Surround with braces",
          ["="] = "Align on =",
          [":"] = "Align on :",
          [","] = "Align on ,",
          ["|"] = "Align on |",
          r = "Remove line numbers",
          b = "Box comment around block",
        },
        ["<leader>v"] = {
          name = "👁️ Visual Block Mode",
          b = "Enter Visual Block mode",
          c = "Select to end of line (column)",
          a = "Select to end of file (column)",
          i = "Insert at beginning of column",
          a = "Append at end of column",
        },
      }, { mode = "x" })

      -- Normal mode block helpers
      wk.register({
        ["<leader>v"] = {
          name = "👁️ Visual Block Mode",
          b = "Enter Visual Block mode",
          c = "Select to end of line (column)",
          a = "Select to end of file (column)",
          i = "Insert at beginning of column",
          a = "Append at end of column",
        },
      }, { mode = "n" })
    end,
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = {
            enable = true,
          },
          shortcut = {
            { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Files",
              group = "Label",
              action = "Telescope find_files",
              key = "f",
            },
            {
              desc = " Apps",
              group = "DiagnosticHint",
              action = "Telescope app",
              key = "a",
            },
            {
              desc = " dotfiles",
              group = "Number",
              action = "Telescope dotfiles",
              key = "d",
            },
          },
        },
      })
    end,
    dependencies = { {"nvim-tree/nvim-web-devicons"}}
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        mappings = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb"},
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing_function = nil,
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
      })
    end,
  },

  -- Visual Block Mode Enhancement Plugin
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    config = function()
      -- Multi-cursor support enhances block mode
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        ["Add Cursor Down"] = "<C-j>",
        ["Add Cursor Up"] = "<C-k>",
        ["Select All"] = "<C-a>",
        ["Visual All"] = "<C-a>",
        ["Start Regex Search"] = "<C-/>",
        ["Visual Regex"] = "<C-/>",
        ["Visual Cursors"] = "<C-c>",
      }
      vim.g.VM_leader = "\\"
    end,
  },

  -- Enhanced text objects for better block operations
  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },

  -- Block alignment plugin
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
    config = function()
      -- Visual mode alignment
      vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
      vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
      
      -- Block-specific alignment shortcuts
      vim.keymap.set("x", "<leader>b=", "ga=", { noremap = false, desc = "Align on =" })
      vim.keymap.set("x", "<leader>b:", "ga:", { noremap = false, desc = "Align on :" })
      vim.keymap.set("x", "<leader>b,", "ga,", { noremap = false, desc = "Align on ," })
      vim.keymap.set("x", "<leader>b|", "ga|", { noremap = false, desc = "Align on |" })
    end,
  },
}
