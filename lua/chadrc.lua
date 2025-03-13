local options = {
  base46 = {
    theme = "onedark",
    theme_toggle = { "onedark", "one_light" },
  },

  ui = {
    telescope = { style = "borderless" },

    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    tabufline = {
      enable = true,
      lazyload = false,
      order = { "buffers", "tabs", "btns", "treeOffset" },
      modules = nil,
      bufwidth = 21,
    },
  },
}

return options
