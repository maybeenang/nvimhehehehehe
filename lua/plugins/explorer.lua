return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = function()
    local command = require("neo-tree.command")
    local find_buffer_by_type = function(type)
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
        if ft == type then return buf end
      end
      return -1
    end

    local toggle_neotree = function(toggle_command)
      if find_buffer_by_type "neo-tree" > 0 then
        command.execute { action = "close" }
      else
        toggle_command()
      end
    end

    return {
      {
        "<leader>e",
        function()
          command.execute { action = "focus", reveal = true, dir = vim.uv.cwd() }
        end,
        desc = "Focus Neotree"
      },
      {
        "<leader>E",
        function()
          toggle_neotree(function() command.execute { action = "focus", reveal = true, dir = vim.uv.cwd() } end)
        end,
        desc = "Toggle Neotree"
      },
    }
  end,
  opts = {
    default_component_configs = {

      modified = {
        symbol = "",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖", -- this can only be used in the git_status source
          renamed   = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      }
    },
    window = {
      width = 30,
      side = "left",
      focusable = true,
      mappings = {
        ["p"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        ["l"] = "focus_preview",
        ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
        ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
      }
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        follow_current_file = {
          enabled = true,
        },
        never_show = {},
      },
    },
  }

}
