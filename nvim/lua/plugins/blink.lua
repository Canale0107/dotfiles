return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        menu = {
          border = "rounded",
        },
      },
      signature = {
        enabled = true,
      },
      snippets = {
        preset = "default",
      },
      sources = {
        default = {
          "lsp",
          "path",
          "buffer",
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
}