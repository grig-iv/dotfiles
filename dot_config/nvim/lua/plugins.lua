require('bootstrap')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- packer
    use 'folke/tokyonight.nvim'  -- colorsheme
    use 'romgrk/barbar.nvim'  -- buffer line
    use 'windwp/nvim-autopairs'  -- auto pairs (){}
    use 'kyazdani42/nvim-web-devicons'  -- icons (using by other plugins)
    use 'kmonad/kmonad-vim'  -- kmonad config syntax highlighting
    use 'ggandor/leap.nvim'  -- kmonad config syntax highlighting

    use 'neovim/nvim-lspconfig'  -- lsp configurator
    use 'williamboman/mason.nvim'  -- lsp manager
    use 'williamboman/mason-lspconfig.nvim'  -- mediator between two above
    use 'ms-jpq/coq_nvim'  -- auto completion
    use 'ms-jpq/coq.artifacts'  -- auto completion snipsets
    use 'glepnir/lspsaga.nvim'  -- pretty ui for lsp
    use 'folke/trouble.nvim'  -- list of lsp stuff
    use 'nvim-treesitter/nvim-treesitter'

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    -- TODO: move to another file
    if packer_bootstrap then
        require('packer').sync()
    end
end)
