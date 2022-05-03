local packer = require"packer"

local use = packer.use

return packer.startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/impatient.nvim',
    config = [[ require('impatient') ]]

  }
  -- dependency for nvim plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'szw/vim-maximizer'

  -- snippet support
  use {
    "windwp/nvim-autopairs",
    config = [[require('nvim-autopairs').setup{}]]
  }

  use {
     "rafamadriz/friendly-snippets",
     event = "InsertEnter",
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require"config.gitsigns"]]
  }

  use "tpope/vim-fugitive"

  -- Debugging
  use {
    'puremourning/vimspector',
    config = [[require"config.vimspector"]]
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require "config.nvim-lspconfig"
    end
  }

  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use {
    "ray-x/lsp_signature.nvim",
    config = [[require"lsp_signature".setup()]]
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    after = "friendly-snippets",
  }

  use {
      "L3MON4D3/LuaSnip",
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
        require"config.cmp"
        require("config.luasnip")
      end,
  }

  use {
     "saadparwaiz1/cmp_luasnip",
     after = "LuaSnip",
  }

  use {
     "hrsh7th/cmp-nvim-lua",
     after = "cmp_luasnip",
  }

  use {
      "hrsh7th/cmp-nvim-lsp",
      after = "cmp-nvim-lua",
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "nvim-cmp",
  }

  use {
	"hrsh7th/cmp-path",
	after = "cmp-buffer",
  }
  -- FZF
  use{
    'nvim-telescope/telescope.nvim',
    config = [[require"config.telescope-nvim"]]
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require "config.treesitter-nvim"]]
  }
  use "nvim-treesitter/playground"

  -- Web Trash
  use {
    "windwp/nvim-ts-autotag",
    config = [[require('nvim-ts-autotag').setup()]]
  }

  -- Help please
  use {
    "folke/which-key.nvim",
    config = [[require "config.whichkey"]]
  }
  use {
    'kyazdani42/nvim-tree.lua',
    opt = true,
    keys = "<leader>n",
    config = [[require('config.nvimtree')]]
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
         require("config.others").blankline()
    end,
  }

  -- lines
  use {
    'akinsho/nvim-bufferline.lua',
    config = [[require'config.nvim-bufferline']],
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'famiu/feline.nvim',
    config = [[ require'config.feline']]
  }

  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }

  use {
    "AndrewRadev/splitjoin.vim",
    keys = { "gJ", "gS" },
  }
  use "machakann/vim-sandwich"

  -- Theme
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require 'colorizer'.setup({'*'}, { mode = 'foreground' }) ]]
  }
  use 'kyazdani42/nvim-web-devicons'

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[ require"config.alpha" ]]
  }

  --use {
  --  'glepnir/dashboard-nvim',
  --  config = [[require"config.nvim-dashboard"]]
  --}
  use 'dracula/vim'

  -- 42
  use 'abellaismail7/42header.nvim'
  use '42Paris/42header'
end)
