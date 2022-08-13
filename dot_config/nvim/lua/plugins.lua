require('bootstrap')

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }  -- Packer
    use { 'EdenEast/nightfox.nvim' }  -- Colorsheme

    -- LSP stuff
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim' }
    use { 'williamboman/mason-lspconfig.nvim' }

    -- CMP stuff
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }

    -- Tab line
    use { 'romgrk/barbar.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }

    -- TODO: move to another file
    if packer_bootstrap then
        require('packer').sync()
    end
end)
