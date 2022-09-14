local map = require('utils').map

map('n', '<C-h>', '<Cmd>BufferPrevious<CR>')
map('n', '<C-l>', '<Cmd>BufferNext<CR>')
map('n', '<C-q>', '<Cmd>BufferClose<CR>')
map('n', '<C-p>', '<Cmd>BufferPick<CR>')

map('n', '<Leader>to', '<Cmd>BufferCloseAllButCurrent<CR>')
map('n', '<Leader>th', '<Cmd>BufferMovePrevious<CR>')
map('n', '<Leader>tl', '<Cmd>BufferMoveNext<CR>')


require('bufferline').setup {
    auto_hide = true,
}
