```txt
▀█ █▀ █░█
█▄ ▄█ █▀█
```

My [zsh](https://www.zsh.org/) config

---

## Installation

This zsh setup uses the standard XDG directories for config, cache, etc.
To enable this, we must set `ZDOTDIR` to the XDG config directory.
The earliest we can do this is when `~/.zshenv` is loaded.

To install this zsh setup:

```sh
cd "${XDG_CONFIG_HOME:-$HOME/.config}"
git clone https://github.com/unkie/unkie-zsh/ zsh
cd "${HOME}"
ln -s ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zshenv.zsh .zshenv
```

---

Header text generated with [hyprtxt](https://github.com/unkie/hyprtxt/)
