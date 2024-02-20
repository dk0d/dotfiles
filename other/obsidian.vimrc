set clipboard=unnamed

imap jk <Esc>
imap jj <Esc>
" nmap j gj
" nmap k gk

map H ^
map L $
exmap back obcommand app:go-back
map <C-o> :back
exmap forward obcommand app:go-forward
map <C-i> :forward
exmap wiki surround [[ ]]
map [[ :wiki

exmap followlink obcommand editor:follow-link
map gd :followlink

"
" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

" Emulate Tab Switching https://vimhelp.org/tabpage.txt.html#gt
" requires Cycle Through Panes Plugins https://obsidian.md/plugins?id=cycle-through-panes
exmap tabnext obcommand cycle-through-panes:cycle-through-panes
nmap gt :tabnext
exmap tabprev obcommand cycle-through-panes:cycle-through-panes-reverse
nmap gT :tabprev

" Maps pasteinto to Alt-p
map <A-p> :pasteinto

unmap <Space>
exmap splitright obcommand workspace:split-vertical
nmap <Space>v :splitright

exmap splitdown obcommand workspace:split-horizontal
nmap <Space>h :splitdown
