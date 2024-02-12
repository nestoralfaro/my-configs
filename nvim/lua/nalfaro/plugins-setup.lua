-- auto install packer if not installed
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
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer
	use("Mofiqul/vscode.nvim") -- vscode theme
  use("christoomey/vim-tmux-navigator") -- tmux && split window navigation
  use("szw/vim-maximizer") -- maximizes and restores current window
  use("tpope/vim-surround") -- add, delete, change surroundings with [motion-y/c/v/d][s][w][character_to_surround_with]
  use("numToStr/Comment.nvim") -- commenting with gc
  use("nvim-tree/nvim-tree.lua") -- file explorer
  use("kyazdani42/nvim-web-devicons") -- icons
  use("nvim-lualine/lualine.nvim") -- status line
  -- telescope (fuzzy finder)
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- lsp
 use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")

  -- required per documentation
	if packer_bootstrap then
		require("packer").sync()
	end
end)
