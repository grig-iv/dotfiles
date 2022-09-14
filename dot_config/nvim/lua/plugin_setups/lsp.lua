-- lspsaga
local bufopts = { noremap=true, silent=true, buffer=bufnr }
local map = vim.keymap.set
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

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.diagnostics.golangci_lint,
        require("null-ls").builtins.formatting.prettier,
    },
})

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
vim.g.coq_settings = {
  keymap = { 
    pre_select = true,
    jump_to_mark = "M",
    bigger_preview = null,
  },
  auto_start = 'shut-up',
}

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
