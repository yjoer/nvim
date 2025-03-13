return {
  {
  "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark"
      })

      require("onedark").load()
    end
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      vim.opt.termguicolors = true
      vim.opt.mousemoveevent = true

      require("bufferline").setup({
        options = {
          hover = {
            enabled = true,
            delay = 50,
            reveal = {"close"}
          }
        }
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark"
        }
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        enable_git_status = true,
        filesystem = {
          filtered_items = {
            hide_gitignored = false,
            hide_hidden = false,
          },
          hijack_netrw_behavior = "open_default",
          window = {
            position = "right",
          },
        }
      })

      vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle action=show<CR>")
      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
    end
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
  },
  {
    "lewis6991/gitsigns.nvim",
    tags = "v1.x",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

      require("ibl").setup({
        indent = { char = "│" },
        scope = { char = "│" },
      })
    end,
  },
}
