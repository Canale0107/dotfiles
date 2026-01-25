return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    -- Not used for setup (Neovim 0.11+ native LSP is configured in lua/lsp_setup.lua),
    -- but it provides :LspInfo and filetype/server definitions many people expect.
    event = "VeryLazy",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "marksman",
        "lua-language-server",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}

