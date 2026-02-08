# 🚀 Simple & Cool Neovim Configuration

A modern, simple yet feature-rich Neovim configuration designed for productivity and aesthetics.

## ✨ Features

### 🎨 Beautiful UI
- **Tokyo Night** colorscheme for a modern dark theme
- **Lualine** statusline with icons and git integration
- **Bufferline** for elegant buffer/tab management
- **Dashboard** with a clean startup screen
- **Indent guides** for better code readability

### 🔧 Core Functionality
- **LSP support** with Mason for easy language server management
- **Treesitter** for advanced syntax highlighting
- **Telescope** fuzzy finder for files, buffers, and text search
- **Neo-tree** file explorer with git integration
- **ToggleTerm** for integrated terminal management

### 🎯 Developer Experience
- **Auto-completion** with nvim-cmp and LSP integration
- **Auto-pairs** for brackets, quotes, and tags
- **Git integration** with Gitsigns for change indicators
- **Comment toggling** with smart commenting
- **Which-key** for keybinding discovery
- **Smooth scrolling** for better navigation

## 📁 Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Auto commands
│   │   └── lazy.lua         # Plugin manager setup
│   └── plugins/
│       ├── colorscheme.lua  # Tokyo Night theme
│       ├── lualine.lua      # Status line
│       ├── bufferline.lua   # Buffer/tab line
│       ├── neo-tree.lua     # File explorer
│       ├── telescope.lua    # Fuzzy finder
│       ├── toggleterm.lua   # Terminal integration
│       ├── treesitter.lua   # Syntax highlighting
│       ├── lsp.lua          # Language servers
│       └── extras.lua       # Additional plugins
```

## ⌨️ Key Mappings

### Leader Key
- `<Space>` is the leader key

### File Navigation
- `<leader>e` - Toggle file explorer (Neo-tree)
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `<leader>fb` - Browse buffers (Telescope)
- `<leader>fh` - Help tags (Telescope)

### Buffer Management
- `Shift+h` - Previous buffer
- `Shift+l` - Next buffer
- `Shift+q` - Close buffer

### Window Navigation
- `Ctrl+h/j/k/l` - Navigate between windows
- `Ctrl+arrows` - Resize windows

### Terminal
- `<leader>tt` - Toggle terminal
- `Ctrl+\` - Quick terminal toggle

### LSP
- `gd` - Go to definition
- `K` - Hover documentation
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>f` - Format code

### Typst / LaTeX
**Leader key ist `<Space>`** (kein Backslash). Beispiel: `<leader>tp` heißt **Space + t + p**.

**Typst**
- `<leader>tp` - Preview toggle
- `<leader>to` - Preview starten
- `<leader>ts` - Preview stoppen

**LaTeX (VimTeX)**
- `<leader>lc` - Kompilieren
- `<leader>lv` - PDF anzeigen
- `<leader>lq` - Kompilierung stoppen

### Other
- `<leader>h` - Clear search highlights
- `<leader>q` - Quit all
- `Ctrl+s` - Save file
- `gcc` - Comment/uncomment line
- `gc` (visual) - Comment/uncomment selection

## 🚀 Installation

1. **Backup your existing config** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Start Neovim**:
   ```bash
   nvim
   ```

3. **Wait for plugins to install**: Lazy.nvim will automatically download and install all plugins on first run.

4. **Install language servers**: Run `:Mason` to install additional language servers for your preferred languages.

## 🔧 Language Server Setup

The configuration comes with these language servers pre-configured:
- **Lua** (lua_ls) - for Neovim configuration
- **TypeScript/JavaScript** (tsserver)
- **Python** (pyright)
- **HTML** (html)
- **CSS** (cssls)
- **JSON** (jsonls)
- **LaTeX** (texlab)
- **Typst** (typst_lsp)

To install additional language servers:
1. Run `:Mason` in Neovim
2. Navigate with `j/k` and press `i` to install
3. Or use `:MasonInstall <server_name>`

## 🎨 Customization

### Changing the Colorscheme
Edit `lua/plugins/colorscheme.lua` and replace `tokyonight` with your preferred theme.

### Adding New Plugins
Create a new file in `lua/plugins/` or add to `lua/plugins/extras.lua`.

### Modifying Keymaps
Edit `lua/config/keymaps.lua` to change or add new key mappings.

## 🐛 Troubleshooting

### Plugin Issues
- Run `:Lazy sync` to update all plugins
- Run `:Lazy clean` to remove unused plugins

### LSP Issues
- Run `:LspInfo` to check LSP status
- Run `:Mason` to reinstall language servers

### Performance Issues
- Run `:checkhealth` for Neovim health check
- Consider disabling some plugins in `lua/plugins/`

## 📚 Learning Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lua Guide for Neovim](https://github.com/nanotee/nvim-lua-guide)
- [Telescope Plugin](https://github.com/nvim-telescope/telescope.nvim)
- [LSP Configuration](https://github.com/neovim/nvim-lspconfig)

---

**Enjoy your new Neovim setup! 🎉**
