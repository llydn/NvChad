require "nvchad.autocmds"

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = {
    "Dockerfile*",
    "*.Dockerfile",
    "*.dockerfile",
    "dockerfile.*",
  },
  callback = function()
    vim.bo.filetype = "dockerfile"
  end,
})
