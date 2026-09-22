require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

map("n", "<leader>wf", "<C-w>|<C-w>_", { desc = "Maximize window" })

map("n", "<leader><F8>", "<cmd>DapToggleBreakpoint<CR>", { desc = "Debug toggle breakpoint" })
map("n", "<leader><F5>", function()
  vim.cmd "DapNew"
end, { desc = "Debug new session" })
map("n", "<leader><F10>", "<cmd>DapStepOver<CR>", { desc = "Debug step over" })
map("n", "<leader><F9>", "<cmd>DapStepInto<CR>", { desc = "Debug step into" })
map("n", "<leader>dc", "<cmd>DapContinue<CR>", { desc = "Debug continue" })
map("n", "<leader>dr", "<cmd>DapRestart<CR>", { desc = "Debug restart" })
map("n", "<leader>dq", "<cmd>DapTerminate<CR>", { desc = "Debug terminate" })
map("n", "<leader>dw", function()
  require("dapui").open { reset = true }
end, { desc = "Debug open UI" })

map("n", "<leader>g", function()
  require "lazygit"
  vim.cmd "LazyGit"
end, { desc = "Open LazyGit" })

map("n", "<leader>rn", function()
  local arg = vim.fn.input "Enter argument: "
  if arg ~= "" then
    require "inc_rename"
    vim.cmd("IncRename " .. arg)
  else
    print "No argument provided."
  end
end, { desc = "LSP incremental rename" })

map("x", "<leader>re", function()
  require("refactoring").refactor "Extract Function"
end, { desc = "Refactor extract function" })
map("x", "<leader>rf", function()
  require("refactoring").refactor "Extract Function To File"
end, { desc = "Refactor extract function to file" })
-- Extract function supports only visual mode
map("x", "<leader>rv", function()
  require("refactoring").refactor "Extract Variable"
end, { desc = "Refactor extract variable" })
-- Extract variable supports only visual mode
map("n", "<leader>rI", function()
  require("refactoring").refactor "Inline Function"
end, { desc = "Refactor inline function" })
-- Inline func supports only normal
map({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor "Inline Variable"
end, { desc = "Refactor inline variable" })
-- Inline var supports both normal and visual mode

map("n", "<leader>rb", function()
  require("refactoring").refactor "Extract Block"
end, { desc = "Refactor extract block" })
map("n", "<leader>rbf", function()
  require("refactoring").refactor "Extract Block To File"
end, { desc = "Refactor extract block to file" })

map("n", "<leader>te", function()
  local ext = vim.fn.expand "%:e"
  local template = "./.template"

  if vim.fn.filereadable(template) == 1 then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.fn.readfile(template))
  else
    vim.notify("No template found for ." .. ext, vim.log.levels.WARN)
  end
end, { desc = "Insert contents of `.template`" })

map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })

map("n", "<leader>a", "<cmd>AerialToggle!<CR>", { desc = "Toggle Aerial outline" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
