require("config.lazy") -- Load plugin manager

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require"lspconfig"

-- Set up nvim-cmp.
local cmp = require"cmp"

cmp.setup({
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  })
})


-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lsp_servers = { "lua_ls", "ts_ls", "angularls", "emmet_language_server" }
for _i, ls in ipairs(lsp_servers) do
  lspconfig[ls].setup {
    capabilities = capabilities
  }
end

-- Vim options
vim.opt.updatetime = 300
vim.o.expandtab = true -- expand tab input with spaces characters
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.o.tabstop = 2 -- num of space characters per tab
vim.o.shiftwidth = 2 -- spaces per indentation level
vim.o.number = true -- View line number
vim.cmd "colorscheme habamax"

