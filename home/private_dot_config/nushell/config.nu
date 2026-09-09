# brew + local bins first (whichever exist on this box)
$env.PATH = (
  [/opt/homebrew/bin /opt/homebrew/sbin /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin ~/.local/bin ~/.local/scripts]
  | path expand | where {|p| $p | path exists }
  | append $env.PATH | uniq
)

$env.config.show_banner = false
$env.config.edit_mode = "vi"

# starship + zoxide via vendor autoload (sourced after config.nu)
let autoload = ($nu.default-config-dir | path join vendor autoload)
mkdir $autoload
if (which starship | is-not-empty) { starship init nu | save -f ($autoload | path join starship.nu) }
if (which zoxide | is-not-empty) { zoxide init nushell | save -f ($autoload | path join zoxide.nu) }

alias l = ls
alias ll = ls -l
alias la = ls -a
alias vi = nvim
alias py = python
alias ipy = ipython
alias cmoi = chezmoi
alias dotfiles = ^tmux-sessionizer (chezmoi source-path)
alias ts = ^tmux-sessionizer
alias nextonic = tectonic -X

alias core-cat = ^cat
alias cat = bat
alias b = bat
alias bn = bat --number
alias bnl = bat --number --line-range
alias bp = bat --plain
alias bpl = bat --plain --line-range
alias bl = bat --line-range

alias lt = eza -T --git-ignore --level=2 --group-directories-first
alias lT = eza -T --git-ignore --level=4 --group-directories-first
alias x = eza --icons
alias xa = eza --icons --all
alias xl = eza --long
alias xla = eza --long --all
alias xt = eza --icons --tree -L 1
alias xtt = eza --icons --tree
alias xta = eza --icons --tree --all
