return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = ":call mkdp#util#install()",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      ft = "markdown",
      desc = "Markdown Preview",
    },
  },
}
