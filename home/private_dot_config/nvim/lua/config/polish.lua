-- This file is automatically ran last in the setup process and is a good place to configure
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here

-- MDX
vim.filetype.add({
	extension = { mdx = "mdx" },
})
vim.treesitter.language.register("markdown", "mdx")

-- PostCSS
vim.filetype.add({
	extension = { pcss = "pcss" },
})

vim.treesitter.language.register("css", "pcss")
