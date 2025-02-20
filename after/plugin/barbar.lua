vim.g.barbar_auto_setup = false

require("barbar").setup({
	animation = false,
	auto_hide = 1,
	sidebar_filetypes = {
		NvimTree = true,
		["neo-tree"] = { event = "BufWipeout" },
	}
})
