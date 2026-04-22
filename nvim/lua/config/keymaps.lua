vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('i', 'jk', '<ESC>')

keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and keep cursor center' })
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and keep cursor center' })

keymap.set('n', '[q', ':cprev<CR>zz', { desc = 'Go to previous item in quickfix and center' })
keymap.set('n', ']q', ':cnext<CR>zz', { desc = 'Go to next item in quickfix and center' })

-- Window management
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>")
vim.keymap.set("n", "<leader>sc", "<cmd>close<cr>")
vim.keymap.set("n", "<C-Up>",    "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Down>",  "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Left>",  "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

keymap.set({'n', 'v'}, 'Y', '"+y', { desc = "Yank to system clipboard" })

-- Telescope
keymap.set('n', '<leader><leader>', function() require('telescope.builtin').find_files() end, { desc = 'Telescope find files' })
keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files({hidden = true, no_ignore = true}) end, { desc = 'Telescope find files' })
keymap.set('n', '<leader>/', function() require('telescope.builtin').live_grep() end, { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>d', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Trouble diagnostics' })

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


-- Highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Better indent (stay in visual mode)
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Move lines up/down
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


--Terminal
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h<i>]], opts)
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j<i>]], opts)
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k<i>]], opts)
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l<i>]], opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
