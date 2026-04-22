return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    vim.filetype.add({
      extension = {
        tf = "terraform",
        tfvars = "terraform",
      },
    })

    require("nvim-treesitter").setup({
      auto_install = true,
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        require("nvim-treesitter").install({
          "lua", "vim", "vimdoc", "query", "bash", "python", "json", "yaml",
          "markdown", "markdown_inline", "dockerfile", "regex", "tsx",
          "typescript", "javascript", "html", "css", "sql", "go", "rust",
          "c", "cpp", "terraform",
        }):wait(300000)
      end,
    })

    vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
}
