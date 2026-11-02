## Prerequisites

* **Neovim >= 0.10.0**: Required by `nvim-treesitter-context` and modern LSP features.
* **Nerd Font**: A patched font (e.g. JetBrainsMono Nerd Font) is required to display icons.
* **Terminal**: Ghostty or Kitty on Linux; WezTerm on Windows + WSL2 (see [dotfiles](https://github.com/pabloChantada/dotfiles)).

## Installation

1. Back up your current config (optional):
```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

2. Clone this repository:
```bash
git clone [YOUR_REPO_URL] ~/.config/nvim
```

3. Install the system dependencies (see section below).

4. Start Neovim:
```bash
nvim
```


The `lazy.nvim` plugin manager will bootstrap automatically. Wait for the installation to finish and restart the editor.

## System Dependencies (Ubuntu/Debian)

For the clipboard, search and language servers to work properly, install the following tools:
```bash
# Update package lists
sudo apt update

# Base tools and compilers (for Treesitter)
sudo apt install build-essential

# Search tools for Telescope
sudo apt install ripgrep fd-find

# Clipboard support (install according to your display server)
# On WSL nothing is needed: clip.exe / PowerShell are used automatically
# For Wayland (Ubuntu 22.04+ default):
sudo apt install wl-clipboard
# For X11 (older systems):
sudo apt install xclip

# Runtime for Mason (installs JS/TS/HTML/CSS LSPs)
sudo apt install nodejs npm

# Python environment (for LSPs and virtual env tools)
sudo apt install python3-venv pipx
pipx ensurepath
```

## Language Servers (LSP)

Servers are managed with `Mason`. You can check their status by running `:Mason` inside Neovim.

* **Python**: `pyright`, `ruff` (linter/formatter). Requires a configured virtual environment.
* **Rust**: `rust-analyzer` (managed via the `rustaceanvim` plugin).
* **Web**: `html`, `cssls`, `ts_ls`, `jsonls`.
* **Lua**: `lua_ls`.

## Terminal Setup (Ghostty)

For visual consistency and transparency, use the following config in `~/.config/ghostty/config`.

```ini
# --- Font ---
font-family = "Hack Nerd Font"
font-size = 11

# --- Kanagawa Dragon theme ---
background = #181820
foreground = #c5c9c5
cursor-color = #c8c093
selection-background = #2d4f67
selection-foreground = #c8c093

# ANSI color palette
palette = 0=#0d0c0c
palette = 1=#c4746e
palette = 2=#8a9a7b
palette = 3=#c4b28a
palette = 4=#8ba4b1
palette = 5=#a292a3
palette = 6=#8ea4a2
palette = 7=#C8C093
palette = 8=#a6a69c
palette = 9=#E46876
palette = 10=#87a987
palette = 11=#E6C384
palette = 12=#7FB4CA
palette = 13=#938AA9
palette = 14=#7AA89F
palette = 15=#c5c9c5

# --- Integration ---
# Transparency (matches the Neovim config)
background-opacity = 0.9
background-blur-radius = 20

# Window settings
window-decoration = true
window-padding-x = 4
window-padding-y = 4
confirm-close-surface = false

# Environment variable so colors are detected correctly
env = TERM=xterm-ghostty
```

## Main Keymaps

The leader key is `<Space>`. Press it and wait to see every shortcut in the which-key popup, or use `<Space>ç` to search them with Telescope.

### Files and Navigation

* `<Space>pv`: Open the native file explorer (Netrw).
* `<Space>e`: Toggle the file tree (NvimTree).
* `<Space>ff`: Find files by name (Telescope).
* `<Space>fg`: Find files tracked by git.
* `<Space>fw`: Find the word under the cursor.
* `<Space>ps`: Search text inside files (Grep).
* `<Space>u`: Undo history (Undotree).
* `<Space>bc`: Close the current buffer.

### Windows

* `<Ctrl>h/j/k/l`: Move between splits.
* `<Space>wh/wj/wk/wl`: Move the current split left/down/up/right.
* `<Ctrl>Arrows`: Resize the current split.

### Git
* `<Space>gg`: Open LazyGit (floating window).
* `<Space>gf` / `<Space>gl`: LazyGit filtered by repo / current file.

### Harpoon (Quick Navigation)

* `<Space>a`: Add file to the list.
* `<Ctrl>e`: Quick file menu.
* `<Ctrl>1-4`: Jump to marked files.
* `<Space>hp` / `<Space>hn`: Previous / next marked file.

### LSP

* `gd`: Go to definition.
* `K`: Hover docs.
* `[d` / `]d`: Previous / next diagnostic.
* `<Space>vd`: Show line diagnostics.
* `<Space>vca`: Code action.
* `<Space>vrr`: References.
* `<Space>vrn`: Rename symbol.
* `<Space>oi`: Organize imports.

### Editing

* `<Space>r`: Replace the word under the cursor across the whole file.
* Formatting runs automatically on save (conform.nvim).

### Copilot

* `<Ctrl>l` / `<Ctrl>]`: Accept / dismiss suggestion.
* `<Space>zo`: Toggle Copilot Chat.
* `<Space>ze` / `zf` / `zr` / `zt` / `zm`: Explain / fix / review / tests / commit message.
