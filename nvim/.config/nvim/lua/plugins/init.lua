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
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "debugpy",
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "biome",
        "pyright",
        "isort",
        "black",
        "ruff",
        "python-lsp-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prisma-language-server",
        "clangd",
        "rust_analyzer",
        "sqruff",
        "sqls",
        "codelldb",
        "wgsl_analyzer",
        "taplo",
        "ruff",
      },
    },
    automatic_installation = true,
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
    version = "6",
    lazy = false,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      local dap = require "dap"

      dap.configurations.rust = {
        {
          name = "Debug Test",
          type = "codelldb",
          request = "launch",
          program = function()
            local cwd = vim.fn.getcwd()
            local project_name = vim.fn.fnamemodify(cwd, ":t")
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/" .. project_name)
            -- return cwd .. "/target/debug/" .. project_name
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = { "--no-capture" },
          console = "integratedTerminal",
          runInTerminal = false,
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = "mfussenegger/nvim-dap",
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
      "nvim-neotest/nvim-nio",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
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
    requires = {
      { "nvim-telescope/telescope.nvim" },
    },
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
