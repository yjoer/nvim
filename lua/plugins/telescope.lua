return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
