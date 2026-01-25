return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Git: next hunk")
        map("n", "[h", gs.prev_hunk, "Git: prev hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Git: stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Git: reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Git: preview hunk")
        map("n", "<leader>hb", gs.blame_line, "Git: blame line")
      end,
    },
  },
}

