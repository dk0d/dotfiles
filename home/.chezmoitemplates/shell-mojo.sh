if [[ -d "$HOME/.modular" ]]; then

	# 🔥 Mojo installed! 🔥

	# Mojo's Python virtual environment created at /Users/daniel/.modular/pkg/packages.modular.com_mojo/venv
	#
	#
	SHELL_NAME=$(echo $SHELL | awk '{p=split($0, a, "/"); print a[p]}')

	if [[ $SHELL_NAME == "zsh" ]]; then

		# If you are using ZSH (default on macOS), run the following commands:
		export MODULAR_HOME="$HOME/.modular"
		export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

	elif [[ $SHELL_NAME == "bash" ]]; then

		# If you are using bash, run the following commands:
		# BASHRC=$([ -f "$HOME/.bash_profile" ] && echo "$HOME/.bash_profile" || echo "$HOME/.bashrc")
		export MODULAR_HOME="$HOME/.modular"
		export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

	fi

	# Then enter 'mojo' to start the Mojo REPL.
	# For tool help, enter 'mojo --help'.
	# For more docs, see https://docs.modular.com/mojo.
fi
