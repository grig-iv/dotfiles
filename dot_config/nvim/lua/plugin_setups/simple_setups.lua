-- color scheme
require('nvim-autopairs').setup()
require('lualine').setup()
require('trouble').setup()
require('go').setup()
require('fidget').setup()
require('dap-go').setup()
require('dapui').setup()
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

require('nvim-tree').setup {
    view = {
        side = "right"
    }
}

require("coq_3p") {
    { src = "nvimlua", short_name = "nLUA", conf_only = true }
}
