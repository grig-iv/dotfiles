require('bootstrap')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- packer
    use 'folke/tokyonight.nvim'  -- colorsheme
    use 'romgrk/barbar.nvim'  -- buffer line
    use 'windwp/nvim-autopairs'  -- auto pairs (){}
    use 'rmagatti/auto-session'  -- session manager
    use 'kyazdani42/nvim-web-devicons'  -- icons (using by other plugins)
    use 'kmonad/kmonad-vim'  -- kmonad config syntax highlighting

    use 'neovim/nvim-lspconfig'  -- lsp configurator
    use 'williamboman/mason.nvim'  -- lsp manager
    use 'williamboman/mason-lspconfig.nvim'  -- mediator between two above
    use 'ms-jpq/coq_nvim'  -- auto completion
    use 'glepnir/lspsaga.nvim'  -- pretty ui for lsp
    use 'folke/trouble.nvim'  -- list of lsp stuff

    -- TODO: move to another file
    if packer_bootstrap then
        require('packer').sync()
    end
end)
