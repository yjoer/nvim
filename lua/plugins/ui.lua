return {
  {
    "nvchad/base46",
    branch = "v3.0",
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvzone/volt",
  },
  {
    "nvzone/menu",
    config = function()
      vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
        require('menu.utils').delete_old_menus()

        vim.cmd.exec('"normal! \\<RightMouse>"')

        local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
        local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

        require("menu").open(options, { mouse = true })
      end, {})
    end,
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = function()
      dofile(vim.g.base46_cache .. "nvimtree")
    end,
    config = function()
      require("nvim-tree").setup({
        hijack_cursor = true,
        disable_netrw = true,
        hijack_netrw = true,
        sync_root_with_cwd = true,
        view = {
          side = "right",
          width = 30,
          preserve_window_proportions = true,
        },
        renderer = {
          root_folder_label = false,
          highlight_git = true,
          indent_markers = { enable = true },
          icons = {
            git_placement = "after",
            glyphs = {
              default = "󰈚",
              folder = {
                default = "",
                empty = "",
                empty_open = "",
                open = "",
                symlink = "",
              },
              git = { unmerged = "" },
            },
          },
        },
        hijack_directories = {
          enable = false,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        filters = {
          git_ignored = false,
        }
      })

      vim.keymap.set("n", "<C-b>", "<Cmd>NvimTreeToggle<CR>")
      vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeFindFile<CR>")
    end,
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     require("neo-tree").setup({
  --       enable_git_status = true,
  --       filesystem = {
  --         filtered_items = {
  --           hide_gitignored = false,
  --           hide_hidden = false,
  --         },
  --         hijack_netrw_behavior = "open_default",
  --         window = {
  --           position = "right",
  --         },
  --       }
  --     })

  --     vim.keymap.set("n", "<C-b>", "<Cmd>Neotree toggle action=show<CR>")
  --     vim.keymap.set("n", "<leader>e", "<Cmd>Neotree reveal<CR>")
  --   end
  -- },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    tags = "v1.x",
    opts = function()
      dofile(vim.g.base46_cache .. "git")
    end,
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")
      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)

      require("ibl").setup(opts)
      dofile(vim.g.base46_cache .. "blankline")
    end,
  },
}
