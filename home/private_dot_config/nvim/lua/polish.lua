-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here


vim.filetype.add({
	extension = { 
		-- PostCSS
		pcss = "pcss",
		-- MDX
		mdx = "mdx",
	},
	pattern = {
		-- .env.* files
		["%.env%..*"] = "dotenv",
	},
})
	
vim.treesitter.language.register("css", "pcss")
vim.treesitter.language.register("markdown", "mdx")
vim.treesitter.language.register("bash", "dotenv")
