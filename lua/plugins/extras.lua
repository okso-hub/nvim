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

  -- Icons for better UI
  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  -- Which-Key for better keybinding discovery
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
        win = {
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

      -- Register Visual Block mode mappings using new spec
      wk.add({
        -- Visual mode block operations
        { "<leader>b", group = "📦 Block Operations", mode = "x" },
        { "<leader>bc", desc = "Comment block (//)", mode = "x" },
        { "<leader>bh", desc = "Comment block (#)", mode = "x" },
        { "<leader>bl", desc = "Comment block (--)", mode = "x" },
        { "<leader>bu", desc = "Uncomment block", mode = "x" },
        { "<leader>bd", desc = "Delete block", mode = "x" },
        { "<leader>by", desc = "Yank block", mode = "x" },
        { "<leader>bp", desc = "Paste block", mode = "x" },
        { "<leader>bU", desc = "Uppercase block", mode = "x" },
        { "<leader>bL", desc = "Lowercase block", mode = "x" },
        { "<leader>bn", desc = "Number lines incrementally", mode = "x" },
        { "<leader>bN", desc = "Number lines with function", mode = "x" },
        { "<leader>ba", desc = "Align block", mode = "x" },
        { '<leader>b"', desc = "Surround with quotes", mode = "x" },
        { "<leader>b'", desc = "Surround with single quotes", mode = "x" },
        { "<leader>b(", desc = "Surround with parentheses", mode = "x" },
        { "<leader>b[", desc = "Surround with brackets", mode = "x" },
        { "<leader>b{", desc = "Surround with braces", mode = "x" },
        { "<leader>b=", desc = "Align on =", mode = "x" },
        { "<leader>b:", desc = "Align on :", mode = "x" },
        { "<leader>b,", desc = "Align on ,", mode = "x" },
        { "<leader>b|", desc = "Align on |", mode = "x" },
        { "<leader>br", desc = "Remove line numbers", mode = "x" },
        { "<leader>bb", desc = "Box comment around block", mode = "x" },

        -- Visual Block mode helpers
        { "<leader>v", group = "👁️ Visual Block Mode", mode = { "n", "x" } },
        { "<leader>vb", desc = "Enter Visual Block mode", mode = { "n", "x" } },
        { "<leader>vc", desc = "Select to end of line (column)", mode = { "n", "x" } },
        { "<leader>vf", desc = "Select to end of file (column)", mode = { "n", "x" } },
        { "<leader>vi", desc = "Insert at beginning of column", mode = { "n", "x" } },
        { "<leader>va", desc = "Append at end of column", mode = { "n", "x" } },
      })
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
      -- Visual mode alignment (use 'ga' to avoid conflicts)
      vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
      vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
    end,
  },
}
