local map = require("utils").map

map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')
map('n', 'J', '}')
map('v', 'J', '}')
map('n', 'K', '{')
map('v', 'K', '{')

map('n', '<Down>',  '<C-w>j')
map('n', '<Up>',    '<C-w>k')
map('n', '<Left>',  '<C-w>h')
map('n', '<Right>', '<C-w>l')

map('o', 'w', 'iw')
map('o', 'W', 'iW')
map('o', 'fw', 'w')
map('o', 'fW', 'W')

map('n', 'Q', '@q')
map('n', 'Y', 'y$')

map('n', '<C-s>', '<Esc><Cmd>w<CR>')
map('v', '<C-s>', '<Esc><Cmd>w<CR>')
map('i', '<C-s>', '<Esc><Cmd>w<CR>')

map('n', '<C-j>', '<C-i>')
map('n', '<C-k>', '<C-o>')

map('n', '<C-c>', '<C-w>q')

-- utils
map('n', '<Leader>j', 'J')
map('n', '<Leader>l', '<Cmd>noh<CR>')
map('n', '<Leader>p', '<Cmd>PackerSync<CR>')

-- Plugins
map('n', '<C-f>', '<Cmd>Telescope find_files<CR>')
map('n', '<C-t>', '<Cmd>TroubleToggle<CR>')
map('n', '<Enter>', '<Cmd>NvimTreeToggle<CR>')  -- <Enter> = <C-m>

map('n', '<Tab>', '<Cmd>Lspsaga hover_doc<CR>')
map('n', '<C-a>', '<Cmd>Lspsaga code_action<CR>')
map('n', '<C-p>', '<Cmd>Lspsaga preview_defenition<CR>')
map('n', '<C-r>', '<Cmd>Lspsaga rename<CR>')
map('n', '[d',    '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
map('n', ']d',    '<Cmd>Lspsaga diagnostic_jump_next<CR>')
