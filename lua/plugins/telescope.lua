return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    opts = function()
      dofile(vim.g.base46_cache .. "telescope")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
