# if [[ $TERM_PROGRAM == "WarpTerminal" || $TERM_PROGRAM == "iTerm.app" || $TERM_PROGRAM == "vscode" || $TERM_PROGRAM == 'tmux' || $TERM_PROGRAM == "WezTerm" || $TERM == "alacritty" ]]; then
if command -v starship &>/dev/null; then
	STARSHIP_SHELL=$(echo $SHELL | awk '{p=split($0, a, "/"); print a[p]}')
	eval "$(starship init $STARSHIP_SHELL)"
fi
