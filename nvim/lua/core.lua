-- Neovim core settings (loaded from `nvim/init.lua`)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

-- Basic keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Treesitter (Neovim 0.11+): enable per-filetype
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldlevel = 99
    -- Optional: experimental indentation from nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- LSP keymaps (set per-buffer on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "gd", vim.lsp.buf.definition, "LSP: go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "LSP: go to declaration")
    map("n", "gr", vim.lsp.buf.references, "LSP: references")
    map("n", "gi", vim.lsp.buf.implementation, "LSP: implementation")
    map("n", "K", vim.lsp.buf.hover, "LSP: hover")
    map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: rename")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: code action")
    map("n", "[d", vim.diagnostic.goto_prev, "Diagnostic: previous")
    map("n", "]d", vim.diagnostic.goto_next, "Diagnostic: next")
    map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostic: float")
    map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostic: loclist")
  end,
})

-- Markdown editing defaults
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.spell = true
    vim.opt_local.conceallevel = 2
    vim.opt_local.concealcursor = "nc"
    vim.opt_local.textwidth = 0
  end,
})

