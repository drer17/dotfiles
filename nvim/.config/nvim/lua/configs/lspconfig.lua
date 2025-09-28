-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "tailwindcss",
  "eslint",
  "prismals",
  "pyright",
  "dockerls",
  "docker_compose_language_service",
  "texlab",
  "buf_ls",
  "sqls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- C/C++ & CUDA
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  cmd = {
    vim.fn.expand "$CLANG_TOOLS" .. "/bin/clangd",
    "--enable-config",
    "--clang-tidy",
    "--compile-commands-dir=build",
  },
}
