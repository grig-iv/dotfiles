local map = require("utils").map

map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')

map('n', 'Q', '@q')
map('n', 'Y', 'y$')

map('n', '<Leader>l', ':noh<CR>')


-- Tabs
map('n', '<C-H>', ':bn<CR>')
map('n', '<C-L>', ':bp<CR>')
map('n', '<Leader>to', ':tabo<CR>')
map('n', '<Leader>td', ':bd<CR>')
