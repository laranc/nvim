vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use { "wbthomason/packer.nvim" }
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	}
	use { "ellisonleao/gruvbox.nvim" }
	use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }
	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
	}
	use { "neovim/nvim-lspconfig" }
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason.lspconfig.nvim" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "lukas-reineke/lsp-format.nvim" }
	use { "m4xshen/autoclose.nvim" }
end)
