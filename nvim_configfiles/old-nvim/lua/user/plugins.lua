local fn = vim.fn

-- Automatically install packer
-- the whole path to the data is "/home/$USER_NAME/.local/share/nvim/site ...."
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself


  -- Additional plugins
  --  use "bakpakin/fennel.vim"


  -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use { "nvim-telescope/telescope.nvim",
        requires = {{ "nvim-lua/plenary.nvim"}}
      }
    use "p00f/nvim-ts-rainbow"
    use 'kyazdani42/nvim-web-devicons'
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    use "lukas-reineke/indent-blankline.nvim"
    use "numToStr/Comment.nvim" -- Easily comment stuff
    --   use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    --   use 'kyazdani42/nvim-tree.lua'
    --   use "akinsho/bufferline.nvim"
    --   use "moll/vim-bbye"
    --   use "nvim-lualine/lualine.nvim"
    --   use "akinsho/toggleterm.nvim"
    --   use "ahmedkhalf/project.nvim"
    --   use "lewis6991/impatient.nvim"
    --   use "lukas-reineke/indent-blankline.nvim"
    --   use "goolord/alpha-nvim"
    --   use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
    --   use "folke/which-key.nvim"


    -- plugins for markdown files to previw it
     use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    --Colorschemes
    use 'shaunsingh/nord.nvim'
    use 'folke/tokyonight.nvim'



  -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"


 -- -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
--
--  -- Git
--   use "lewis6991/gitsigns.nvim"
--  -- LSP

    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

--------------
--  use  "goerz/jupytext.vim"

 -- use 'ThePrimeagen/vim-be-good'
-- debugger
--    use   "puremourning/vimspector"
  --    use 'mfussenegger/nvim-dap'
  --    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  --  use "untitled-ai/jupyter_ascending.vim"
--taskwiki
--     use "tools-life/taskwiki"
--    use "vimwiki/vimwiki"
    -- use "plasticboy/vim-markdown"
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
