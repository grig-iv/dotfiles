local map = require("utils").map

map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')
map('n', 'J', '}')
map('v', 'J', '}')
map('n', 'K', '{')
map('v', 'K', '{')

map('n', 'Q', '@q')
map('n', 'Y', 'y$')

map('n', '<C-s>', '<Esc>:w<CR>')
map('v', '<C-s>', '<Esc>:w<CR>')
map('i', '<C-s>', '<Esc>:w<CR>')

-- utils
map('n', '<Leader>uj', 'J')
map('n', '<Leader>ul', ':noh<CR>')
