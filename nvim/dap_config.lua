local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("dap-go").setup() -- uses dlv on PATH; adds Go launch/test debug configs

-- Open the debugger UI automatically when a session starts, close on exit
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- Gutter signs
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual" })

local map = vim.keymap.set
map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "DAP: conditional breakpoint" })
map("n", "<leader>dc", dap.continue, { desc = "DAP: continue / start" })
map("n", "<leader>di", dap.step_into, { desc = "DAP: step into" })
map("n", "<leader>do", dap.step_over, { desc = "DAP: step over" })
map("n", "<leader>dO", dap.step_out, { desc = "DAP: step out" })
map("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: toggle REPL" })
map("n", "<leader>dl", dap.run_last, { desc = "DAP: run last" })
map("n", "<leader>du", dapui.toggle, { desc = "DAP: toggle UI" })
map("n", "<leader>dt", function() require("dap-go").debug_test() end, { desc = "DAP: debug nearest Go test" })
map("n", "<leader>dx", dap.terminate, { desc = "DAP: terminate" })
