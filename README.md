# 🌟 My Neovim configuration

A minimalist and fast Neovim setup tailored for **TypeScript**, **TailwindCSS**, **Lua**, and **Zig** development.

---

## ✨ Features

- **Treesitter** syntax highlighting and text objects
- **Autocompletion** (`nvim-cmp`) with snippet support
- **Neo-tree** floating explorer and **Telescope** picker for files/grep/navigation
- **LSP + Mason** management with format/lint integration

---

## 🖥️ Screenshots

### TypeScript + TailwindCSS
![TypeScript + TailwindCSS](https://github.com/user-attachments/assets/d59f7af4-261b-42f4-8eab-56258bdc20ff)

---

### Zig
![Zig](https://github.com/user-attachments/assets/75089fb5-45fa-4a9e-a679-2e9edd95b00c)

---

### Rust
![Rust](https://github.com/user-attachments/assets/011ce1f4-a6e1-4f89-b906-63e034ed2322)

---

## 📦 Plugin Highlights

> Some major plugins included:

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)

---

## ⌨️ Keymaps

### Explorer and Search
- `<leader>e` explorer in project root (neo-tree)
- `<leader>E` explorer in current file directory (neo-tree)
- `<leader>ff` find files in project root (git-aware)
- `<leader>fg` live grep in project root
- `<leader>fG` live grep in current file directory
- `<leader>fb` list buffers
- `<leader>fr` resume last Telescope picker

### Window Navigation
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` move between windows
- `<leader>wh` / `<leader>wj` / `<leader>wk` / `<leader>wl` move between windows

### Buffer Navigation
- `<S-h>` / `<S-l>` previous/next buffer
- `[b` / `]b` previous/next buffer
- `<leader>bb` switch to alternate buffer
- `<leader>\`` switch to alternate buffer
- `<leader>bd` delete current buffer
- `<leader>bo` delete other buffers

### Diagnostics and LSP
- `<leader>q` open diagnostics location list
- `<leader>d` line diagnostics float
- `[d` / `]d` previous/next diagnostic
- `gD` declaration
- `gd` definition
- `gi` implementation
- `gr` references
- `K` hover
- `<C-k>` signature help
- `<leader>ca` code action
- `<leader>rn` rename symbol
- `<leader>rs` restart LSP

### Editing Helpers
- `<A-j>` / `<A-k>` move line/selection down/up (normal/insert/visual)
- `<C-s>` save file
- `<Esc>` clear search highlight
- `<Esc><Esc>` leave terminal mode
- `<leader>gg` open LazyGit
- `<leader>qq` quit all

---

## 🚀 Getting Started

Clone this repo into your Neovim configuration directory:

```bash
git clone https://github.com/DevRadion/nvim-config ~/.config/nvim
```
Requires Neovim 0.11+
