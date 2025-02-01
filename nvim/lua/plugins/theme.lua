return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		-- "folke/tokyonight.nvim",
		"sainnhe/everforest",
		priority = 1000, -- Make sure to load this before all the other start plugins.

		init = function()
			-- You can configure highlights by doing something like:
			vim.cmd.hi("Comment gui=italic")

			vim.g.everforest_background = "medium"
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_better_performance = 1

			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			vim.o.background = "dark" -- "light"
			vim.cmd.colorscheme("everforest")
		end,
	},
}
