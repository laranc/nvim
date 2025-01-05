function SetColorScheme(color, bg)
	color = color or "gruvbox"
	bg = bg or "dark"
	vim.o.background = bg
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme()
