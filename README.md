dotfiles managed with [`chezmoi`](https://github.com/twpayne/chezmoi)

One line install:

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/dk0d/dotfiles/refs/heads/main/install.sh)"
```

---

TODO

- [ ] better setup for `nvm` in `fish` shell (via `fisher`)

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish
```
