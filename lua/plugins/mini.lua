return {
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),       -- class
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },           -- tags
          d = { "%f[%d]%d+" },                                                          -- digits
          e = {                                                                         -- Word with case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
          },
          -- i = LazyVim.mini.ai_indent,                              -- indent
          -- g = LazyVim.mini.ai_buffer,                              -- buffer
          u = ai.gen_spec.function_call(),                           -- u for "Usage"
          U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
        },
      }
    end
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },
  {
    "echasnovski/mini.surround",
    event = "BufRead",
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'echasnovski/mini.starter',
    version = false,
    event = "VimEnter",
    config = function()
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      -- get current leader key
      local leader = vim.g.mapleader or "\\"

      local footer = table.concat({
        "Press j/k or <UP>/<DOWN> to navigate",
        "Press <C-p> to Find Files (Telescope)",
        "Press " .. leader .. "e to open File Explorer",
        "Press " .. leader .. "q to close",
      }, "\n")

      local starter = require("mini.starter")
      starter.setup({
        evaluate_single = true,
        items = {
          -- starter.sections.recent_files(10, false),
          starter.sections.recent_files(10,true, false),
          -- starter.sections.telescope(),
          -- Use this if you set up 'mini.sessions'
          starter.sections.sessions(5, true),
          starter.sections.builtin_actions(),
        },
        footer = footer,
        content_hooks = {
          starter.gen_hook.adding_bullet(),
          starter.gen_hook.indexing('all', { 'Builtin actions' }),
          starter.gen_hook.padding(3, 2),
          starter.gen_hook.aligning('center', 'center'),
        },
      })

      local opts = {
        noremap = true,
        silent = true,
        buffer = true,
      }

      local augroup = vim.api.nvim_create_augroup("MiniStarterJK", { clear = true })

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        group = augroup,
        callback = function()
          vim.keymap.set("n", "j", function () MiniStarter.update_current_item('next') end, opts)
          vim.keymap.set("n", "k", function () MiniStarter.update_current_item('prev') end, opts)
          vim.keymap.set("n", "<C-p>", function () require("telescope.builtin").find_files() end, opts)
        end,
      })

      -- vim.cmd([[
      --   augroup MiniStarterJK
      --     au!
      --     au User MiniStarterOpened nmap <buffer> j <Cmd>lua MiniStarter.update_current_item('next')<CR>
      --     au User MiniStarterOpened nmap <buffer> k <Cmd>lua MiniStarter.update_current_item('prev')<CR>
      --     au User MiniStarterOpened nmap <buffer> <C-p>  <Cmd>lua Telescope.builtin.find_files()<CR>
      --     " au User MiniStarterOpened nmap <buffer> <C-n> <Cmd>lua MiniStarter.update_current_item('next')<CR>
      --     " au User MiniStarterOpened nmap <buffer> <C-p> <Cmd>lua MiniStarter.update_current_item('prev')<CR>
      --   augroup END
      -- ]])
    end
  },
}
