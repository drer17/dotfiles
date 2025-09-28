local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black", "isort" },
    css = { "prettier" },
    html = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    json = { "biome" },
    javascript = { "prettier" },
    typescriptreact = { "prettier" },
    typescript = { "prettier" },
    sql = { "sqruff" },
  },
  formatter_opts = {
    sqruff = {
      extra_args = {
        "--indent",
        "2",
      },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
