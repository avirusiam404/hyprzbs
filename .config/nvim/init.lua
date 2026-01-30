vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin/nvim" },
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-mini/mini.hipatterns",
    version = false,
  },
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    opts = {},
  },
})

local builtin = require("telescope.builtin")
--vim.keymap.set("n", "<leader>dff", builtin.find_files, {})
--vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript"},
  hightlight = { enable = true },
  indent = { enable = true },
})

function getmode()
  local mode = vim.api.nvim_get_mode()["mode"]
  local mode_map = {
    n = 'N', -- Normal mode
    i = 'I', -- Insert mode
    v = 'V', -- Visual mode
    [''] = 'V', -- Visual block mode
    V = 'V', -- Visual line mode
    c = 'C', -- Command-line mode
    no = 'N', -- NInsert mode
    s = 'S', -- Select mode
    S = 'S', -- Select line mode
    ic = 'I', -- Insert mode (completion)
    R = 'R', -- Replace mode
    Rv = 'R', -- Virtual Replace mode
    cv = 'C', -- Command-line mode
    ce = 'C', -- Ex mode
    r = 'R', -- Prompt mode
    rm = 'M', -- More mode
    ['r?'] = '?', -- Confirm mode
    ['!'] = '!', -- Shell mode
    t = 'T', -- Terminal mode
  }
  return mode_map[mode] or '[UNKNOWN]'
end

require("lualine").setup({
  options = {
    theme = "neopywal",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    icon_enabled = true,
  },
  sections = {
    lualine_a = {{getmode}},
    lualine_b = {{"filetype",icon_only=true,},"filename","progress","location"},
    lualine_c = {},

    lualine_z = {"filesize"},
    lualine_y = {},
    lualine_x = {},
  },
  extentions = {},
})

require("neopywal").setup()
vim.cmd.colorscheme("neopywal")
