return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mason-org/mason.nvim",
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      ensure_installed = {
        "biome",
        "black",
        "clangd",
        "css-lsp",
        "debugpy",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "html-lsp",
        "isort",
        "kotlin-lsp",
        "ktfmt",
        "lua-language-server",
        "prettier",
        "prisma-language-server",
        "pyright",
        "ruff",
        "stylua",
        "tailwindcss-language-server",
        "taplo",
        "texlab",
        "typescript-language-server",
        "wgsl-analyzer",
        "xmlformatter",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "rust",
        "toml",
        "tsx",
        "wgsl",
        "swift",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
      },
      renderer = {
        group_empty = true,
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascriptreact", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)

      local dap = require "dap"

      table.insert(dap.configurations.python, {
        name = "Python: Current File",
        type = "python",
        request = "launch",
        program = "${file}",
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        envFile = "${workspaceFolder}/.env",
      })

      table.insert(dap.configurations.python, {
        name = "Pytest: Current File",
        type = "python",
        request = "launch",
        module = "pytest",
        args = { "${file}" },
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        envFile = "${workspaceFolder}/.env",
      })

      table.insert(dap.configurations.python, {
        name = "Pytest: Current File With Output",
        type = "python",
        request = "launch",
        module = "pytest",
        args = { "${file}", "-s", "-W ignore::DeprecationWarning" },
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        envFile = "${workspaceFolder}/.env",
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "lukahartwig/pnpm.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "kevalin/mermaid.nvim",
    ft = { "mermaid", "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("mermaid").setup()
    end,
  },
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      show_line_numbers = true,
      attach_mode = "global",
      show_guides = true,
    },
  },
}
