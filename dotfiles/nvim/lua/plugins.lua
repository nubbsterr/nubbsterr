-- Bootstrap lazy.nvim 
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

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd.colorscheme "tokyonight-moon"
    end
  },
  -- plenary.nvim: Required dependency for Telescope
  { "nvim-lua/plenary.nvim" },
  -- Markdown viewer for neovim!
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  -- Telescope: Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",  -- Pin to a stable version
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = { ["<esc>"] = require("telescope.actions").close },  -- Close with Esc in insert mode
          },
        },
      })
    end,
  },
  -- nvim-treesitter: Modern syntax highlighting and parsing
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Auto-update parsers on install
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "c", "bash" },
        highlight = { enable = true },  -- Enable syntax highlighting
      })
    end,
  },
  -- Status line!
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },  -- Icons
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight-moon",  
        section_separators = "",         
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },                                 -- Current mode
        lualine_b = { "branch", "diff", "diagnostics" },        -- Git info and errors
        lualine_c = { "filename" },                             -- File name
        lualine_x = { "encoding", "fileformat", "filetype" },   -- File details
        lualine_y = { "progress" },                             -- Progress in file
        lualine_z = { "location" },                             -- Line/column
      },
    })
    end,
  },
  -- See hex colours in neovim
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        '*',  -- Apply to all filetypes
        css = { css = true },  
        html = { names = true }, 
      })
    end,
  },
})
