-- ensure the packer plugin manager is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require"packer"

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'lewis6991/impatient.nvim',
    config = [[ require('impatient') ]]
  }
  -- dependency for nvim plugins
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- snippet support
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

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require "config.lsp"
    end
  }

  use {
	  'j-hui/fidget.nvim',
	  config = [[require"fidget".setup({text = {spinner = "dots_pulse", done = ""}})]]
  }

  use 'tjdevries/nlua.nvim'
  use 'tjdevries/lsp_extensions.nvim'
  use {
    "ray-x/lsp_signature.nvim",
    config = [[require"config.others".lsp_signature()]]
  }
  use {
	  "jose-elias-alvarez/null-ls.nvim",
	  config = [[ require'config.null-ls' ]],
  }

  use {
	  'simrat39/rust-tools.nvim',
	  after = "nvim-lspconfig",
	  ft = {'rust'},
	  config = [[require'config.lsp.rust']]
  }

  use {
	  'mfussenegger/nvim-jdtls',
	  ft = {'java'},
	  config = [[ require'config.lsp.java' ]],
  }

  -- debug
  use {
	  'mfussenegger/nvim-dap',
	  wants = {},
	  config= [[require'config.dap']]
  }
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'

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

  use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip", }
  use { "hrsh7th/cmp-nvim-lua", 	after = "cmp_luasnip", }
  use { "hrsh7th/cmp-nvim-lsp", 	after = "cmp-nvim-lua", }
  use { "hrsh7th/cmp-buffer", 		after = "cmp-nvim-lsp", }
  use { "hrsh7th/cmp-path", 		after = "cmp-buffer", }

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

  use 'RRethy/nvim-treesitter-textsubjects'
  use "nvim-treesitter/playground"

  use {
    'numToStr/Comment.nvim',
    config = [[require('Comment').setup()]]
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = [[ require("todo-comments").setup() ]],
 }

  -- Web Trash
  use {
	"jose-elias-alvarez/typescript.nvim",
	config = [[require'config.lsp.ts']]
  }
  use {
    "windwp/nvim-ts-autotag",
	ft = {"typescript", "typescriptreact"},
	wants = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup { enable = true }
    end,
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

  -- lines
  use {
    'kdheepak/tabline.nvim',
    config = [[require'config.tabline']],
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
	"tiagovla/scope.nvim",
	config = [[ require("scope").setup() ]],
  }

  use {
    'feline-nvim/feline.nvim',
    config = [[ require'config.feline']]
  }

  -- utils
  use {'akinsho/toggleterm.nvim', tag = '*', config = [[require'config.term']]}

  use { 's1n7ax/nvim-window-picker', tag = 'v1.*', config = 'require"config.win_picker"' }

  use { "windwp/nvim-autopairs", config = [[require('nvim-autopairs').setup{}]] }

  use {'kevinhwang91/nvim-bqf', ft = 'qf'}
  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  }

  use {
    "AndrewRadev/splitjoin.vim",
    keys = { "gJ", "gS" },
  }
  use "machakann/vim-sandwich"

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = [[ require"config.alpha" ]]
  }

  -- l3adama
	use {
		'hkupty/iron.nvim',
		ft = {'lua', 'python'},
		config = [[require'config.iron']]
	}
  -- Theme
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
         require("config.others").blankline()
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = [[ require 'colorizer'.setup({'*'}, { mode = 'foreground' }) ]]
  }
  use 'kyazdani42/nvim-web-devicons'

  -- 42
  use {
	  'abellaismail7/42header.nvim',
	  ft = {"c", "cpp"}
  }
  use {
	  '42Paris/42header',
	  ft = {"c", "cpp"}
  }
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end
