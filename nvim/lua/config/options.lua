local o = vim.opt

-- Enable line numbers
o.nu = true
-- Enable relative line numbers
o.rnu = true

-- Search
o.ignorecase = true
o.smartcase = true

-- Tabs and indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true

-- Disable line wrapping
o.wrap = false
-- Set scroll off
o.scrolloff = 8

-- Disable swap file
o.swapfile = false

o.foldmethod = "manual"

-- Split
o.splitright = true
o.splitbelow = true

o.foldlevel = 99

o.runtimepath:append(vim.fn.stdpath("data") .. "/site")
o.termguicolors = true
