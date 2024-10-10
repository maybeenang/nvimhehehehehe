return {
  {

    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('copilot').setup({
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = false,
            accept_word = false,
            -- Accept the current with right arrow
            accept_line = "<S-Right>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })


      -- Enable <Tab> to indent if no suggestions are available
      vim.keymap.set('i', '<Tab>', function()
        if require('copilot.suggestion').is_visible() then
          require('copilot.suggestion').accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
        end
      end, { desc = 'Super Tab', silent = true })

    end
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   lazy = false,
  --   config = function()
  --     require("copilot_cmp").setup({
  --       event = { "InsertEnter", "LspAttach" },
  --       fix_pairs = true,
  --     })
  --   end
  -- },
  {
    "AndreM222/copilot-lualine",
    lazy = false,
    event = "VimEnter",
  }

}
