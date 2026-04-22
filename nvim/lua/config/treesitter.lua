-- Filetype mapping
vim.filetype.add({
  extension = {
    tf = "terraform",
    tfvars = "terraform",
  },
})

-- Treesitter language alias
vim.treesitter.language.register("terraform", "tf")

