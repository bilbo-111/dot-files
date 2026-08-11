return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    lazy = false,
    opts = {
      provider_selector = function(bufnr, filetype, buftype)
        if filetype == "python" then
          return { "lsp", "treesitter" }
        end
        return { "treesitter", "indent" }
      end,
    },
  },
}
