require('bootstrap')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- packer
    use 'EdenEast/nightfox.nvim'  -- colorsheme
    use 'windwp/nvim-autopairs'  -- auto pairs (){}
    use 'rmagatti/auto-session'  -- session saver
    use 'kmonad/kmonad-vim'  -- kmonad config syntax highlighting

    -- lsp + lsp server manager + (lsp/server manager) mediator
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- auto completion
    use 'ms-jpq/coq_nvim'

    -- tab line + icons
    use 'romgrk/barbar.nvim'
    use 'kyazdani42/nvim-web-devicons'


    -- TODO: move to another file
    if packer_bootstrap then
        require('packer').sync()
    end
end)
