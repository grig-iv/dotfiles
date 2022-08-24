local map = require('utils').map

map('n', '<C-h>', '<Cmd>BufferPrevious<CR>')
map('n', '<C-l>', '<Cmd>BufferNext<CR>')
map('n', '<C-x>', '<CR><Cmd>BufferClose<CR>')
map('n', '<C-p>', '<Cmd>BufferPick<CR>')

map('n', '<Leader>to', '<Cmd>BufferCloseAllButCurrent<CR>')
map('n', '<Leader>th', '<Cmd>BufferMovePrevious<CR>')
map('n', '<Leader>tl', '<Cmd>BufferMoveNext<CR>')

map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>')


require('bufferline').setup {
    auto_hide = true,
}
