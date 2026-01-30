# oh-my-kitty

个人终端工作流配置集合（Kitty + tmux + Neovim + Zsh）。
Personal terminal workflow setup (Kitty + tmux + Neovim + Zsh).

## 目录 / Contents
- 简介 / Overview
- 结构 / Structure
- 依赖 / Requirements
- 安装步骤 / Install Steps
- 使用方式 / Usage
- 功能与要点 / Features & Highlights
- 插件清单 / Plugin List
- 快捷键要点 / Key Highlights
- 说明 / Notes
- 许可 / License

## 简介 / Overview
这是我自用的终端环境配置仓库，重点是 Kitty 终端、tmux 联动、多键位映射，以及基于 LazyVim 的 Neovim 体验。
This repo is my personal terminal setup, focused on Kitty, tmux integration, key mappings, and a LazyVim-based Neovim experience.

## 结构 / Structure
- `kitty/` — Kitty 配置、主题与脚本
- `nvim/` — Neovim 配置（LazyVim + 自定义插件与键位）
- `.tmux.conf` — tmux 配置（与 Kitty / Neovim 联动）
- `.zshrc` — Zsh + Oh My Zsh 及常用插件

## 依赖 / Requirements
必需（核心体验）：
Required (core):
- Kitty terminal
- tmux
- Neovim (0.9+ recommended)
- Oh My Zsh
- Nerd Font（用于图标/分隔符，建议 JetBrains Mono Nerd Font）

可选（增强体验）：
Optional (nice-to-have):
- Homebrew（macOS）
- powerlevel10k
- zsh-autosuggestions / zsh-syntax-highlighting / extract / web-search

## 安装步骤 / Install Steps
以下以 macOS 为主，按需取用。
Primarily for macOS. Adjust as needed.

1) 基础依赖 / Core tools
- 安装 Kitty、tmux、Neovim、Oh My Zsh、Nerd Font
- 建议确保 `kitty` 与 `tmux` 的 TERM 兼容（本仓库使用 `xterm-kitty`）

2) 字体 / Font
- 使用 Nerd Font 版本的 JetBrains Mono（或同类 Nerd Font）
- 若图标/分隔符显示异常，优先检查字体是否生效

3) Zsh 生态 / Zsh setup
- 安装 Oh My Zsh
- 安装 `powerlevel10k` 与 `.zshrc` 中列出的插件
- `.zshrc` 内包含 Homebrew 初始化与常用 alias

4) Kitty
- 将 `kitty/` 放入 `~/.config/kitty`（或软链接）
- `kitty/current-theme.conf` 为当前主题入口
- `kitty_search` 已内置，无需额外下载

5) tmux
- 将 `.tmux.conf` 放到 `~/.tmux.conf`
- 首次启动 tmux 时会自动下载 TPM（见配置内 if-shell）
- 进入 tmux 后运行 `prefix + I` 安装插件

6) Neovim
- 将 `nvim/` 放到 `~/.config/nvim`
- 首次启动会由 LazyVim / lazy.nvim 自动安装插件
- Mason 会预装常用 LSP/格式化/检查工具（可在 `nvim/lua/plugins/mason.lua` 调整）

## 使用方式 / Usage
按你自己的使用习惯选择一种方式即可：
Pick whichever approach fits your workflow:

1) 直接复制（最直观）
1) Copy directly (simplest)
- 将 `kitty/` 放到 `~/.config/kitty`
- 将 `nvim/` 放到 `~/.config/nvim`
- 将 `.tmux.conf` 放到 `~/.tmux.conf`
- 将 `.zshrc` 放到 `~/.zshrc`

2) 使用软链接（推荐，便于版本管理）
2) Symlink (recommended for versioning)
```bash
ln -s /path/to/oh-my-kitty/kitty ~/.config/kitty
ln -s /path/to/oh-my-kitty/nvim ~/.config/nvim
ln -s /path/to/oh-my-kitty/.tmux.conf ~/.tmux.conf
ln -s /path/to/oh-my-kitty/.zshrc ~/.zshrc
```

3) 仅拣选需要的模块
3) Pick-and-choose
- 例如只使用 `kitty/` + `.tmux.conf`，或仅导入 `nvim/`

## 功能与要点 / Features & Highlights
Kitty:
- 字体与外观：JetBrains Mono Nerd Font、透明背景与模糊、Powerline 风格标签栏
- 布局与操作：Tall/Splits/Stack 布局，快捷键分屏/新标签
- 主题管理：`kitty/current-theme.conf` 为当前主题，`kitty/themes/` 内置大量主题预设
- 搜索 Kitten：集成 `kitty_search`，快捷键 `kitty_mod+/` 打开终端历史搜索
- Tmux 快捷入口：`cmd+m` 打开 tmux 选择器（基于 fzf）
- 系统快捷键兼容：Mac 的 Cmd+A/C/V 映射到 Ctrl+Shift，用于 tmux/nvim

Neovim (LazyVim):
- UI/导航：状态栏、Bufferline、Neo-tree、Navigator 分屏导航
- 编辑体验：Better-escape、Visual Multi、Smartcolumn
- 语言支持：Treesitter 覆盖前端/Go/Rust/JSON/YAML 等
- 格式化/检查：Conform + nvim-lint，支持 Biome/ESLint/Prettier/Go/Rust 等
- 工具链：Mason 预置常用 LSP/格式化/检查工具

## 插件清单 / Plugin List
tmux (TPM):
- tmux-plugins/tpm
- tmux-plugins/tmux-sensible
- tmux-plugins/tmux-thumbs
- sainnhe/tmux-fzf
- wfxr/tmux-fzf-url
- tmux-plugins/tmux-yank
- catppuccin/tmux
- tmux-plugins/tmux-battery
- tmux-plugins/tmux-cpu
- omerxx/tmux-sessionx
- omerxx/tmux-floax
- tmux-plugins/tmux-resurrect
- tmux-plugins/tmux-continuum

Neovim (custom plugins in repo):
- LazyVim/LazyVim
- catppuccin/nvim, folke/tokyonight.nvim, rebelot/kanagawa.nvim
- nvim-lualine/lualine.nvim, sontungexpt/witch-line
- akinsho/bufferline.nvim
- nvim-neo-tree/neo-tree.nvim, stevearc/oil.nvim
- numToStr/Navigator.nvim
- max397574/better-escape.nvim
- mg979/vim-visual-multi
- m4xshen/smartcolumn.nvim
- Bekaboo/dropbar.nvim
- FabijanZulj/blame.nvim
- karb94/neoscroll.nvim
- gpanders/editorconfig.nvim
- stevearc/conform.nvim
- mfussenegger/nvim-lint
- mason-org/mason.nvim
- neovim/nvim-lspconfig
- nvim-treesitter/nvim-treesitter
- olexsmir/gopher.nvim
- epwalsh/obsidian.nvim
- vuki656/package-info.nvim
- HiPhish/rainbow-delimiters.nvim
- rasulomaroff/reactive.nvim
- shellRaining/hlchunk.nvim
- gen740/SmoothCursor.nvim (当前默认关闭)
- petertriho/nvim-scrollbar (当前默认关闭)
- NStefan002/screenkey.nvim (当前默认关闭)
- shortcuts/no-neck-pain.nvim (lazy)
- folke/flash.nvim / folke/noice.nvim / folke/trouble.nvim / folke/which-key.nvim (部分被 overrides 调整)

## 快捷键要点 / Key Highlights
Kitty:
- `cmd+d` / `cmd+r`：水平 / 垂直分屏
- `cmd+t`：新标签页
- `cmd+m`：打开 tmux session 选择器
- `alt+c` / `alt+v`：复制 / 粘贴
- `kitty_mod+/`：搜索终端历史（kitty_search）
- `ctrl+shift+backspace`：重置字体大小

tmux:
- Prefix: `Ctrl + A`
- `Ctrl + H/J/K/L`：在 tmux 与 nvim 间智能切换 pane
- `Shift + ←/→`：切换窗口

Neovim:
- `Ctrl+h/j/k/l`：窗口导航（Navigator）
- `<leader>kk`：保存
- `<leader>wq`：保存并退出
- `<leader>dd`：关闭 buffer
- `Ctrl+Shift+a/c/v/s/z`：类 Mac 体验的全选/复制/粘贴/保存/撤销

## 说明 / Notes
- Kitty 配置包含 macOS 专用选项（如 `macos_force_single_window`），如需在其他系统使用请自行调整。
- 主题切换可直接替换 `kitty/current-theme.conf` 或使用 Kitty 的 `kitten themes` 更新该文件。

## 许可 / License
暂未指定许可协议。Not specified yet.
