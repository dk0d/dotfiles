export EDITOR=nvim

if [[ -d /usr/local/sbin ]]; then
	export PATH=/usr/local/sbin:$PATH
fi

export PATH=$HOME/.local/bin:$HOME/.local/scripts:$PATH

JJ_CONFIG=$HOME/.config/jj

set -o vi 
set editing-mode vi
set keymap vi

# Poetry python env variables
# if [ -d ~/blue ]; then
# 	export POETRY_CONFIG_DIR=~/blue/.config/pypoetry
# 	export POETRY_CACHE_DIR=~/blue/.cache/pypoetry
# else
# 	export POETRY_CONFIG_DIR=~/.config/pypoetry
# 	export POETRY_CACHE_DIR=~/.cache/pypoetry
# fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
