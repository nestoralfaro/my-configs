local opt = vim.opt

-- for cursor highlight
-- opt.updatetime = 1

-- set formatoptions-=cro # disable autocommenting on new line

-- keep cursor block in all modes
opt.guicursor = "n-v-c-i:block"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 8

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
