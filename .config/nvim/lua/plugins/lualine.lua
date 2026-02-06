return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "catppuccin/nvim"
  },
  config = function()
    local lualine = require("lualine")
    lualine.setup()
    
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

  end,
  lazy = false,
}
