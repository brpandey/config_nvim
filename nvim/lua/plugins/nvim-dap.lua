return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			require("dap").continue()
			require("dap").set_log_level("INFO") -- Helps when configuring DAP, see logs with :DapShowLog

			-- :RustLsp[!] debuggables
			vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Debugger step into" })
			vim.keymap.set("n", "<leader>dv", ":DapStepOver<CR>", { desc = "Debugger step over" })
			vim.keymap.set("n", "<leader>do", ":DapStepOut<CR>", { desc = "Debugger step out" })
			vim.keymap.set("n", "<leader>dc", ":DapContinue<CR>", { desc = "Debugger continue" })
			vim.keymap.set("n", "<leader>db", ":DapToggleBreakpoint<CR>", { desc = "Debugger toggle breakpoint" })
			vim.keymap.set("n", "<leader>dt", ":DapTerminate<CR>", { desc = "Debugger reset" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			handlers = {},
			-- DAP servers: Mason will be invoked to install these if necessary.
			ensure_installed = {
				"delve",
				"codelldb",
			},
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	-- Language Specific Plugins
	{
		"leoluz/nvim-dap-go",
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
}
