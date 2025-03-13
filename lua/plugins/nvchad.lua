return {
  {
    "nvchad/base46",
    branch = "v3.0",
    enabled = false,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvchad/ui",
    enabled = false,
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvzone/volt",
    enabled = false,
  },
  {
    "nvzone/menu",
    enabled = false,
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
    enabled = false,
    cmd = { "Shades", "Huefy" },
  },
  -- {
  --   "nvim-tree/nvim-web-devicons",
  --   enabled = false,
  --   opts = function()
  --     dofile(vim.g.base46_cache .. "devicons")
  --     return { override = require "nvchad.icons.devicons" }
  --   end,
  -- },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
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
}
