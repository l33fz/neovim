local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- code above, if packer is not installed, its gonna install it 

-- Autocommand that reloads nvim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end -- tries to import packer

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  --base
  use 'nvim-lua/plenary.nvim'

  use 'szw/vim-maximizer' -- maximize single split
  use 'tpope/vim-surround' -- surround words with chars

  -- themes
  use "lunarvim/Onedarker.nvim"
  use 'bluz71/vim-moonfly-colors'
  use 'patstockwell/vim-monokai-tasty'
  use 'marko-cerovac/material.nvim'
  -- file explorer
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons' -- for icons

  -- telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  use 'L3MON4D3/LuaSnip' -- snippet engine
  use 'saadparwaiz1/cmp_luasnip' --show snippets in autocompletion
  -- use 'rafamadriz/friendly-snippets' -- collection of useful snippets

  -- managing & installing lsp servers, linters & formatters
  use 'williamboman/mason.nvim' -- in charge of managing lsp servers, linters & formatters
  use 'williamboman/mason-lspconfig.nvim' -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use 'neovim/nvim-lspconfig'  -- easily configure language servers
  use 'hrsh7th/cmp-nvim-lsp' -- so that lsp appears in autocomplete
  use {'glepnir/lspsaga.nvim', branch = 'main' }
  use 'onsails/lspkind.nvim'

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...


  -- Automatically set up your configuration after cloning packer.nvim (end of plugins)
  if packer_bootstrap then
    require('packer').sync()
  end
end)
