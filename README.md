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

TODO

- [ ] better setup for `nvm` in `fish` shell (via `fisher`)

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
```
