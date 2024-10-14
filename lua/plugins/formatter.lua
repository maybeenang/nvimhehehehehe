return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatter_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javacriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        -- python = { "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    vim.keymap.set({ "n", "x", "v", "i" }, "<F3>", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format" })
  end
}
