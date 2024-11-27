# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('{{ .chezmoi.homeDir }}/.miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "{{ .chezmoi.homeDir }}/.miniforge/etc/profile.d/conda.sh" ]; then
        . "{{ .chezmoi.homeDir }}/.miniforge/etc/profile.d/conda.sh"
    else
        export PATH="{{ .chezmoi.homeDir }}/.miniforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "{{ .chezmoi.homeDir }}/.miniforge/etc/profile.d/mamba.sh" ]; then
    . "{{ .chezmoi.homeDir }}/.miniforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
