

alias cmoi='chezmoi'
alias dotfiles='tmux-sessionizer $(chezmoi source-path)'



if status is-interactive
    # Commands to run in interactive sessions can go here
  starship init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $HOME/.miniforge/bin/conda
    eval $HOME/.miniforge/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "$HOME/.miniforge/etc/fish/conf.d/conda.fish"
        . "$HOME/.miniforge/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "$HOME/.miniforge/bin" $PATH
    end
end

if test -f "$HOME/.miniforge/etc/fish/conf.d/mamba.fish"
    source "$HOME/.miniforge/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

