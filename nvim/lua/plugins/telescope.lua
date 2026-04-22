return {
  'nvim-telescope/telescope.nvim', branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          "__pycache__",
          "%.pyc",
          "%.pyo",
          "%.venv",
          "%.egg%-info",
          "%.git/",
          "node_modules/",
        },
        mappings = {
          i = {
            ["<C-s>"] = actions.select_vertical,
          },
          n = {
            ["<C-s>"] = actions.select_vertical,
          },
        },
      },
      pickers = {
        diagnostics = {
          previewer = true,
        },
      },
    })
  end,
}
