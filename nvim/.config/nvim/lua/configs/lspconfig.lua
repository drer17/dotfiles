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
vim.lsp.config.clangd = {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  cmd = {
    "clangd",
    "--enable-config",
    "--clang-tidy",
    "--compile-commands-dir=build",
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
vim.lsp.enable "clangd"

-- swift ui
vim.lsp.config.sourcekit_lsp = {
  cmd = { "xcrun", "sourcekit-lsp" },
  filetypes = { "swift", "objc", "objcpp", "c", "cpp" },

  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  root_dir = function(bufnr, on_dir)
    local util = require "lspconfig.util"
    local filename = vim.api.nvim_buf_get_name(bufnr)

    on_dir(
      util.root_pattern("buildServer.json", ".bsp")(filename)
        or util.root_pattern(".xcodeproj", ".xcworkspace")(filename)
        or util.root_pattern("compile_commands.json", "Package.swift")(filename)
        or util.find_git_ancestor(filename)
    )
  end,
}
vim.lsp.enable "sourcekit_lsp"
