-- color scheme
vim.g.tokyonight_style = "storm"
vim.cmd('colorscheme tokyonight')


require('nvim-autopairs').setup()
require('auto-session').setup()
require('trouble').setup()
require('lspsaga').init_lsp_saga()
