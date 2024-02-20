local vscode = require 'vscode-neovim'
vim.g.mapleader = ' '

vim.g.keymap.set('n', 'K', function() vscode.notify 'editor.action.showHover' end)

-- vim.g.keymap.set('n', 'K', function() vscode.notify 'editor.action.showHover' end)
-- vim.g.keymap.set('n', 'gD', function() vscode.notify 'editor.action.peekDefinition' end)
-- vim.g.keymap.set('n', 'K', function() vscode.notify 'editor.action.showHover' end)

return {}
