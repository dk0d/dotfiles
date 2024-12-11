return {
	-- 	{
	-- 		"kevinhwang91/nvim-bqf",
	-- 		enable = false,
	-- 		event = "VeryLazy",
	-- 		ft = { "qf" },
	-- 		dependencies = {
	-- 			"junegunn/fzf",
	-- 			"nvim-treesitter/nvim-treesitter",
	-- 		},
	-- 	},
	{
		"yorickpeterse/nvim-pqf",
		enable = false,
		event = "VeryLazy",
		config = function(_, opts)
			require("pqf").setup(opts)
		end,
	},
}
