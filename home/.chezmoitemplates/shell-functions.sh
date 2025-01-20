watcher() {
	watch -n $3 "tail -c 1000 $1 | tr '\r' '\n' | tail -n $2"
}

if [ $(uname) = 'Darwin' ]; then

	# remove .DS_Store files recursively in a directory, defaulting to the current directory
	function rmdsstore() {
		find "${@:-.}" -type f -name .DS_Store -delete
	}

	# set dock autohide time to zero
	function dockshowtime() {
		defaults write com.apple.dock autohide-delay -float "${@:-0.0}"
		defaults write com.apple.dock autohide-time-modifier -int "${@:-0}"
		killall Dock
	}

	# toggle dock show whether apps or hidden
	function dockshowhidden() {
		defaults write com.apple.Dock showhidden -bool "${@:-'true'}"
		killall Dock
	}

fi

function pyproc() {
	ps aux | grep '[p]ython\s'
}

function charmproc() {
	ps aux | grep '[p]ython\s.*pycharm'
}

most_recent_file() {
	ls -Artls $1 | tail -n 1
}

most_recent_kernel_file() {
	ls -Artls ~/.jupyter/kernels | tail -n 1 | awk '{print $10}'
}

jqt_get_kernels() {
	rsync -avPz $1:~/.local/share/jupyter/runtime/ ~/.jupyter/kernels/
}

jqt_connect() {
	jupyter qtconsole \
		--style=monokai \
		--JupyterWidget.include_other_output=True \
		--ssh=$1 \
		--existing=~/.jupyter/kernels/kernel_$2.json
}

printtermcolors() {
	for x in {0..2}; do
		for i in {30..37}; do
			for a in {40..47}; do
				echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
			done
			echo
		done
	done
	echo ""
}

function nvims() {
	items=("default", "lazyvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

# Send ghostty terminfo to a remote machine over ssh if
# there are wierd errors
# https://ghostty.org/docs/help/terminfo#ssh
function ghostty-infocmp() {
	infocmp -x | ssh $@ -- tic -x -;
}


