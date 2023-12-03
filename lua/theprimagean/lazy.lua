-- This file can be loaded by calling `lua require('plugins')` from your init.vim Only required if you have packer configured as `opt`
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


vim.g.mapleader = ' '

local plugins = {


  {
        "nvim-telescope/telescope.nvim", tag = '0.1.4' ,
	  -- or                            , branch = '0.1.x',
	  dependencies= { {'nvim-lua/plenary.nvim'} }
  },

  {
	  'rose-pine/neovim',
	  name= 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  } ,

  "nvim-treesitter/playground",
  "theprimeagen/harpoon",
  "theprimeagen/refactoring.nvim",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  "nvim-treesitter/nvim-treesitter-context",

  {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  dependencies= {
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
  },

  "folke/zen-mode.nvim",
  "github/copilot.vim",
  "eandrju/cellular-automaton.nvim",
  "laytan/cloak.nvim",

  'neovim/nvim-lspconfig',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  "solidjs-community/solid-snippets",
  'junegunn/goyo.vim',

     {
        "nvim-tree/nvim-tree.lua",
        after = "nvim-web-devicons",
        dependencies= "nvim-tree/nvim-web-devicons",
    },

   {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	build= "make install_jsregexp"
},


--{
  --  'numToStr/Comment.nvim',
    --config = function()
      --  require('Comment').init()
    --end
-- },



{
  'sudormrfbin/cheatsheet.nvim',

  dependencies= {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
},
-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
},
{
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
{
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
},

{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3500,
    },
  },

{
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
},
{
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = true,
},


-- animations
{
  "echasnovski/mini.animate",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.scroll = {
      enable = false,
    }
  end,
},

{ "folke/neodev.nvim", opts = {} }



--{
  --"AckslD/nvim-neoclip.lua",
  --'dependencies= {
    -- you'll need at least one of these
    --{'nvim-telescope/telescope.nvim'},
    -- {'ibhagwan/fzf-lua'},
  --},
  --config = function()
    --require('neoclip').init()
  --end,
--},
 }

 require("lazy").setup(plugins, {})

require('nvim-treesitter.configs').setup({
  ensure_installed = {'astro', 'tsx', 'typescript', 'html'},
  auto_install = true,
  highlight = {
    enable = true
  }
})



