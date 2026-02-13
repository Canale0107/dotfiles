-- Telescope: ファジーファインダー
-- ファイル検索・全文検索・バッファ切替などを統一UIで提供する
--
-- キーマップ:
--   <leader>ff  ファイル名で検索 (find_files)
--   <leader>fg  ファイル内容をgrep検索 (live_grep) ※要 ripgrep
--   <leader>fb  開いているバッファ一覧から選択 (buffers)
--   <leader>fh  Neovimヘルプタグを検索 (help_tags)
--
-- Telescope内の操作:
--   <C-j>/<C-k>  候補を上下に移動 (insertモード時)
--   <CR>          選択した候補を開く
--   <C-c>/<Esc>   閉じる

return {
  -- Telescope の依存ライブラリ (非同期ユーティリティ)
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- :Telescope コマンドまたは以下のキーマップで初めて読み込まれる (遅延ロード)
    cmd = "Telescope",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help tags",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- fzf アルゴリズムによる高速マッチング (make が必要)
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          -- insertモードでの候補移動を Ctrl+j/k に割り当て
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })

      -- fzf-native が利用可能なら読み込む (失敗しても無視)
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
