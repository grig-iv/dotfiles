-- color scheme
require('nvim-autopairs').setup()
require('trouble').setup()
require('go').setup()
require('lspsaga').init_lsp_saga()

require('nvim-treesitter.configs').setup {
    ensure_installed = { "go", "lua", "rust" },
    highlight = { enable=true }
}

vim.g.tokyonight_style = "storm"
vim.cmd('colorscheme tokyonight')

local leap = require('leap')
leap.set_default_keymaps()
leap.opts.highlight_unlabeled = true
