require('bootstrap')

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'  -- packer
    use 'folke/tokyonight.nvim'  -- colorsheme
    use 'romgrk/barbar.nvim'  -- buffer line
    use 'windwp/nvim-autopairs'  -- auto pairs (){}
    use 'kyazdani42/nvim-web-devicons'  -- icons (using by other plugins)
    use 'kmonad/kmonad-vim'  -- kmonad config syntax highlighting
    use 'ggandor/leap.nvim'  -- kmonad config syntax highlighting
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-tree.lua'

    use 'neovim/nvim-lspconfig'  -- lsp configurator
    use 'williamboman/mason.nvim'  -- lsp manager
    use 'williamboman/mason-lspconfig.nvim'  -- mediator between two above
    use { 'ms-jpq/coq_nvim', branch='coq' }  -- auto completion
    use { 'ms-jpq/coq.artifacts', branch='artifacts' }  -- auto completion snipsets
    use { 'ms-jpq/coq.thirdparty', branch='3p' }
    use { 'glepnir/lspsaga.nvim', branch='main' }  -- pretty ui for lsp
    use 'folke/trouble.nvim'  -- list of lsp stuff
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-telescope/telescope.nvim'
    use 'j-hui/fidget.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'leoluz/nvim-dap-go'

    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    -- dependincies
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'

    -- TODO: move to another file
    if packer_bootstrap then
        require('packer').sync()
    end
end)
