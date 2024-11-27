-- if vim.g.loaded_dash ~= nil then vim.fn.finish() end

-- vim.g.loaded_dash = 1

-- function Dash(search)
--   vim.fn.exec("dash://" . )
-- end

-- function! s:Dash(search)
--   exec 'silent !open "dash://' . join(split(a:search), ':') . '"'
--   redraw!
-- endfunction
--
-- command! -bar -nargs=+ Dash call s:Dash(<q-args>)
-- nnoremap dx :Dash <C-R>=&filetype<CR> <cword><CR>
return {}
