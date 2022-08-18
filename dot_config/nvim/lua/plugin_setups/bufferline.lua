local map = require('utils').map

-- Move to previous/next
map('n', '<A-h>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-l>', '<Cmd>BufferNext<CR>')

-- Re-order to previous/next
map('n', '<A-k>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A-j>', '<Cmd>BufferMoveNext<CR>')

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')

map('n', '<A-,>', '<Cmd>BufferFirst<CR>')
map('n', '<A-.>', '<Cmd>BufferLast<CR>')

-- Pin/unpin buffer
map('n', '<Leader>tp', '<Cmd>BufferPin<CR>')

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')

-- Magic buffer-picking mode
map('n', '<A-p>', '<Cmd>BufferPick<CR>')
map('n', '<Leader>to', '<Cmd>BufferCloseAllButCurrent<CR>')

-- Sort automatically by...
map('n', '<Leader>tsb', '<Cmd>BufferOrderByBufferNumber<CR>')
map('n', '<Leader>tsd', '<Cmd>BufferOrderByDirectory<CR>')
map('n', '<Leader>tsl', '<Cmd>BufferOrderByLanguage<CR>')
map('n', '<Leader>tsw', '<Cmd>BufferOrderByWindowNumber<CR>')


require('bufferline').setup {
    auto_hide = true,
    insert_at_end = true,
}
