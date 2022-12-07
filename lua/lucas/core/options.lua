local opt = vim.opt -- option prefix

-- line numbering
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4

-- search
opt.hlsearch = true
opt.smartcase = true -- case insensitive when searching lowercase
opt.incsearch = true

-- appearance
opt.cursorline = true -- stupid cursorline
opt.termguicolors = true -- colorscheme can work properly?? (needs true color term?)
opt.background = "dark" -- make colorschemes default to dark
opt.signcolumn = "yes" -- weird column on the left side? might need later

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- forces nvim to use system clipboard

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- other behavior
opt.iskeyword:append("-") -- consider string-string as whole word
opt.lazyredraw = true -- good for macros
opt.wrap = false
