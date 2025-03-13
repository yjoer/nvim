return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function()
    dofile(vim.g.base46_cache .. "treesitter")
  end,
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "javascript", "typescript", "html" },
      sync_install = false,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    })
  end
}
