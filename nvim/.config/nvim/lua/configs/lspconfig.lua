-- load NvChad defaults
local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

-- common options
local opts = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- servers list
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
  "wgsl_analyzer",
}

-- setup servers
for _, server in ipairs(servers) do
  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

-- C/C++ & CUDA (clangd)
vim.lsp.config("clangd", {
  on_attach = opts.on_attach,
  on_init = opts.on_init,
  capabilities = opts.capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  cmd = {
    "clangd",
    "--enable-config",
    "--clang-tidy",
    "--compile-commands-dir=build",
  },
})
vim.lsp.enable "clangd"
