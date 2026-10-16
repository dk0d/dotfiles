dotfiles managed with [`chezmoi`](https://github.com/twpayne/chezmoi)

One line install:

https

```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init dk0d --verbose --apply
```

ssh

```bash
$ sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init dk0d --verbose --apply --ssh
```

---

## Theme

Edit `home/.chezmoidata/theme.toml` to change the shared copper-and-ink palette.
Ghostty, Neovim, tmux, Lazygit, Television, Starship, and Delta read it through
chezmoi templates. Incline and Lualine inherit Neovim's palette; OpenCode's
`system` theme inherits Ghostty's terminal colors.

Run `chezmoi diff`, then `chezmoi apply`, and reload the affected apps.
Edit the palette in the source directory, rather than the generated config files.

TODO

- [ ] better setup for `nvm` in `fish` shell (via `fisher`)

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
```
