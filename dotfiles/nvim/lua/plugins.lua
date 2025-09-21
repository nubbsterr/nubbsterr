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
  -- plenary.nvim: Required dependency for Telescope
  { "nvim-lua/plenary.nvim" },

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
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },  -- Icons
  config = function()
    require("lualine").setup({
      options = {
        theme = "codedark",  
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
})
