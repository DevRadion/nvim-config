# nvim

Minimal Neovim config focused on fast editing, LSP, and search.

## Keymaps

### Search / Explorer
| Key | Action |
| --- | --- |
| `<leader>e` | Toggle `neo-tree` at project root |
| `<leader>E` | Reveal current file directory in `neo-tree` |
| `<leader>ff` | Find files in project |
| `<leader>fg` | Live grep in project |
| `<leader>fG` | Live grep in current file directory |
| `<leader>fb` | List buffers |
| `<leader>fr` | Resume last Telescope picker |

### Windows
| Key | Action |
| --- | --- |
| `<C-h>` | Focus left window |
| `<C-j>` | Focus lower window |
| `<C-k>` | Focus upper window |
| `<C-l>` | Focus right window |
| `<leader>wh` | Focus left window |
| `<leader>wj` | Focus lower window |
| `<leader>wk` | Focus upper window |
| `<leader>wl` | Focus right window |

### Buffers
| Key | Action |
| --- | --- |
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `[b` | Previous buffer |
| `]b` | Next buffer |
| `<leader>bb` | Alternate buffer |
| `<leader>\`` | Alternate buffer |
| `<leader>bd` | Delete current buffer |
| `<leader>bo` | Delete other buffers |

### LSP / Diagnostics
| Key | Action |
| --- | --- |
| `gD` | Go to declaration |
| `gd` | Go to definition |
| `gi` | Go to implementation |
| `gr` | References |
| `K` | Hover |
| `<C-k>` | Signature help |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `<leader>d` | Line diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>rs` | Restart LSP |
| `<leader>q` | Diagnostics location list |

### Editing
| Key | Action |
| --- | --- |
| `<A-j>` | Move line/selection down |
| `<A-k>` | Move line/selection up |
| `<C-s>` | Save |
| `<Esc>` | Clear search highlight |
| `<Esc><Esc>` | Exit terminal mode |
| `<leader>gg` | LazyGit |
| `<leader>qq` | Quit all |

### Completion (`nvim-cmp`, insert mode)
| Key | Action |
| --- | --- |
| `<Tab>` | Next item / snippet expand-jump |
| `<S-Tab>` | Previous item / snippet jump back |
| `<CR>` | Confirm completion |
| `<C-Space>` | Open completion menu |
| `<C-e>` | Abort completion |
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-b>` | Docs up |
| `<C-f>` | Docs down |

### Neo-tree (inside tree window)
| Key | Action |
| --- | --- |
| `l` | Open node |
| `/` | Fast find from current tree path |
