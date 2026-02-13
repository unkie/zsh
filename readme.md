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

This setup also uses [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh).

To install this zsh setup:

```sh
cd "${XDG_CONFIG_HOME:-$HOME/.config}"
git clone https://github.com/unkie/zsh/ zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git oh-my-zsh
cd "${HOME}"
ln -s ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/zshenv.zsh .zshenv
```

If you also install [starshp](https://starship.rs/) and [my config](https://github.com/unkie/starship/), you get a prettier prompt.

---

Header text generated with [hyprtxt](https://github.com/unkie/hyprtxt/)

