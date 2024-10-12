return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "BufWinEnter",
    keys = function ()
      local goto = function (num)
       require('bufferline').go_to(num, true) 
      end

      return {
        { "<A-1>", function() goto(1) end, desc = "Buffer 1" },
        { "<A-2>", function() goto(2) end, desc = "Buffer 2" },
        { "<A-3>", function() goto(3) end, desc = "Buffer 3" },
        { "<A-4>", function() goto(4) end, desc = "Buffer 4" },
        { "<A-5>", function() goto(5) end, desc = "Buffer 5" },
        { "<A-6>", function() goto(6) end, desc = "Buffer 6" },
        { "<A-7>", function() goto(7) end, desc = "Buffer 7" },
        { "<A-8>", function() goto(8) end, desc = "Buffer 8" },
        { "<A-9>", function() goto(9) end, desc = "Buffer 9" },
        { "<A-0>", function() goto(10) end, desc = "Buffer 10" },
      }
    end,
    config = function()
      require('bufferline').setup {
        options = {
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
          end,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          separator_style = "thin",
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center"
            }
          }
        }
      }
    end
  }
}
