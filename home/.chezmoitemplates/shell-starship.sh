if command -v starship &>/dev/null; then
	# STARSHIP_SHELL=$(echo $SHELL | awk '{p=split($0, a, "/"); print a[p]}')
	eval "$(starship init zsh)"
fi
