return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle reveal<cr>", desc = "Explorer (neo-tree)" },
      { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus Explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- アイコン
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false, -- trueにすると隠しファイルも常に見える
          hide_dotfiles = false, -- dotfileは見せる派を推奨（git管理で大事）
          hide_gitignored = true,
          hide_by_name = { "node_modules", ".git" },
        },
      },
      window = {
        width = 34,
        mappings = {
          ["<space>"] = "toggle_node",
          ["P"] = { "toggle_preview", config = { use_float = true } },
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    },
  },
}

