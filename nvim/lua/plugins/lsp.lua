return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", config = true },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "ts_ls",
          "terraformls",
        },
        automatic_enable = true,  -- auto-enable via vim.lsp.enable
      })

      -- Global default settings (applied to all LSPs)
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })

      vim.lsp.config("*", {
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        end,
      })

      -- Per-server custom overrides (if needed)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            runtime = { version = "LuaJIT" },
          },
        },
      })
    end,
  },
}
