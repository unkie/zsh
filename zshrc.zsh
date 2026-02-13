#
# ▀█ █▀ █░█ █▀█ █▀▀
# █▄ ▄█ █▀█ █▀▄ █▄▄
#
# Loaded when the shell is interactive


# █▀█ █░█ ░░ █▀▄▀█ █▄█ ░░ ▀█ █▀ █░█
# █▄█ █▀█ ▀▀ █░▀░█ ░█░ ▀▀ █▄ ▄█ █▀█
#
# We want to use Oh My Zsh.
# Here we configure it.

# Where we put omz.
ZSH="${XDG_CONFIG_HOME}/oh-my-zsh"

# where we put out custom config.
ZSH_CUSTOM="${XDG_CONFIG_HOME}/zsh/config"

# Custom prompt theme.
ZSH_THEME="prompt"

# We want to use the cache dir for the completions cache.
ZSH_COMPDUMP="${XDG_CACHE_HOME}/zsh/zcompdump"

# We want hypen insensitive completion (- and _)
HYPHEN_INSENSITIVE="true"

# Disable auto-updates.
zstyle ':omz:update' mode disabled  # disable automatic updates

# Use this timestamp format when showing the command history.
HIST_STAMPS="yyyy-mm-dd"

# Which plugins to load.
plugins=()

# Load omz.
source $ZSH/oh-my-zsh.sh

