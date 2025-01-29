alias cmoi='chezmoi'
alias dotfiles='tmux-sessionizer $(chezmoi source-path)'

{{ if eq .chezmoi.os "linux" }}
alias linux_info='uname -m && cat /etc/*release'
{{ end -}}

if ! command -v eza &>/dev/null; then

	### Colored ls
	if [ -x /usr/bin/dircolors ]; then
		eval "$(dircolors -b)"
		alias l='ls -lGah'
		alias ls='ls --color=auto -lGah'
		alias la='ls -lGAh'
		alias ll='ls -lGh'
	elif [ "$PLATFORM" = Darwin ]; then
		alias l='ls -lGah'
		alias ls='ls -G'
		alias la='ls -lGAh'
		alias ll='ls -lGh'
	fi
else
	alias l='eza -l --all --group-directories-first'
	alias ll='eza -l --all --all --group-directories-first --git'
	alias la='eza -l --all --group-directories-first --git'

	alias ls='eza -l'

	alias lt='eza -T --git-ignore --level=2 --group-directories-first'
	alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
	alias lT='eza -T --git-ignore --level=4 --group-directories-first'
	alias li='eza -la --icons --group-directories-first --git'
	alias lg='eza -la --git --icons --group-directories-first --git'
	alias ld='eza -laD'
fi

if command -v lazygit &>/dev/null; then
	alias lz='lazygit'
fi

if command -v supabase &>/dev/null; then
	alias supa='supabase'
fi

if command -v bat &>/dev/null; then
	alias cat='bat'
fi

if command -v zellij &>/dev/null; then
	alias zj='zellij'
fi

if command -v rg &>/dev/null; then
	alias grep='rg'
else
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# TMUX
alias tmuxa="tmux attach"
alias tmuxat="tmux attach -t"
alias tmuxns="tmux new -s"
alias tmuxls="tmux ls"
alias tls="tmux ls"
alias ts="tmux-sessionizer"

# PDM
alias pdmact='pdm venv activate in-project'
alias pdma='eval $(pdm venv activate in-project)'

# Conda
alias ca='conda activate'
alias condaenv='conda env export --no-builds --from-history'
if command -v mamba &>/dev/null; then
	alias ma='mamba activate'
	alias mambaenv='mamba env export --no-builds --from-history'
fi

alias py='python'
alias ipy='ipython'

alias duh='du -h -d 1 .'
alias duh_='du -h -d 1 . > foldersizes.txt &'

# Hipergator
if command -v squeue &>/dev/null; then
	alias slq='squeue -A woodard'
	alias slqm='squeuemine'
	alias sacctw='sacct -S 0501 -o JobIDRaw,JobName,User,NCPUS,AllocCPUS,MaxRSS,Reqtres,Elapsed -a -A woodard'
fi
if command -v nvidia-smi &>/dev/null; then
	alias wgpu='watch -d -n 1 nvidia-smi'
fi
if command -v srun &>/dev/null; then
	alias icpu="srun --partition=hpg-dev --mem=124gb --ntasks=1 --cpus-per-task=8 --time=04:00:00 --pty bash -i"
	function igpu() {
		local gres="gpu:${3:-geforce}:${1:-1}"
		local mem="${2:-128gb}"
		local tasks="${4:-5}"
		srun --gres=$gres --mem=$mem --tasks=$tasks --nodes=1 --time=08:00:00 --cpus-per-task=6 --partition=gpu --qos=woodard --pty -u bash -i
	}
fi

if command -v tectonic &>/dev/null; then
	alias nextonic="tectonic -X"
fi

# Github CLI
if command -v gh &>/dev/null; then

	# create branch for issue and checkout
	alias prc='gh pr create'

	# create branch for issue and checkout
	alias oissue='gh issue develop -c'

fi

if command -v pnpm &>/dev/null; then
	alias pnp='pnpm'
fi

if command -v zoxide &>/dev/null; then
	if [ "$(basename $SHELL)" = "zsh" ]; then
		eval "$(zoxide init zsh)"
	else
		eval "$(zoxide init bash)"
	fi
	alias cd='z'
fi

# Utils
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
# alias vi='nvim'
alias nv='nvim'

# MacOS
if [ $(uname) = "Darwin" ]; then
	alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder'
	alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder'
	alias ofd='open_command $PWD'
fi

# headless initialization for AstroNvim
alias astroinit="nvim --headless -c 'autocmd User LazyDone quitall'"

# legacy ANTLR stuff
# export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
# alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
# alias grun='java org.antlr.v4.gui.TestRig'

alias jqt_start="jupyter qtconsole --style=monokai --JupyterWidget.include_other_output=True"
alias jconsole="jupyter console --style=monokai --JupyterWidget.include_other_output=True"

# Start ipython kernel
alias ipykernel="ipython kernel --ip=0.0.0.0"
# Connect to remote kernel

# Poetry (python)
# alias poe='poetry run poe'
# alias poetry_activate='source "$( poetry env info --path )/bin/activate"'

alias nvim-lazy="NVIM_APPNAME=lazyvim nvim"
alias nvim-astro="NVIM_APPNAME=astronvim nvim"

# JIRA

if command -v jira &>/dev/null; then
	alias jime="jira issue list -a$(jira me) -s~'Dev Complete' -s~Done --order-by due --reverse"
fi


