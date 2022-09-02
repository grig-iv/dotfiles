-- lspsaga
local bufopts = { noremap=true, silent=true, buffer=bufnr }
local map = vim.keymap.set
map('n', '<Tab>', '<Cmd>Lspsaga hover_doc<CR>', bufopts)
map('n', '<C-a>', '<Cmd>Lspsaga code_action<CR>', bufopts)

map('n', '<Leader>rn', '<Cmd>Lspsaga rename<CR>', bufopts)

-- LSP
local opts = { noremap=true, silent=true }
map('n', '<Leader>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<Leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<Leader>li', vim.lsp.buf.hover, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<Leader>f', vim.lsp.buf.formatting, bufopts)
end


-- mason
require('mason').setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
}

require('mason-lspconfig').setup {
    ensure_installed = { 'sumneko_lua', 'bashls', 'rust_analyzer' }
}

-- coq setup
local coq = require('coq')

-- servers setups
require('mason-lspconfig').setup_handlers {
    function (server_name) -- default handler (optional)
        require('lspconfig')[server_name].setup (
            coq.lsp_ensure_capabilities {
                on_attach = on_attach
            }
        )
    end
}
