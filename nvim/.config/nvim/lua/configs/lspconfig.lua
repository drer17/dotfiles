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
  "wgsl_analyzer",
}

-- setup servers
for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- C/C++ & CUDA (clangd)
vim.lsp.config("clangd", {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  cmd = {
    "clangd",
    "--enable-config",
    "--clang-tidy",
    "--compile-commands-dir=build",
  },
})
vim.lsp.enable "clangd"

-- Swift
vim.lsp.config("sourcekit", {
  cmd = { "xcrun", "sourcekit-lsp" },
})
vim.lsp.enable "sourcekit"

-- Kotlin/Android development
local android_jdk = "/Applications/Android Studio.app/Contents/jbr/Contents/Home"

vim.lsp.config("kotlin_lsp", {
  cmd_env = {
    JAVA_HOME = android_jdk,
    PATH = android_jdk .. "/bin:" .. vim.env.PATH,
  },
})
vim.lsp.enable "kotlin_lsp"
