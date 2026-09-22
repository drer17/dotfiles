local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
    css = { "prettier" },
    html = { "prettier" },
    -- xml = { "xmlformatter" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    json = { "biome" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    typescript = { "prettier" },
    toml = { "taplo" },
    -- cargo install --git https://github.com/wgsl-analyzer/wgsl-analyzer wgslfmt
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
