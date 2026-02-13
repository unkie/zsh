# We want sbin in our path
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin

# Set colors for `ls'.
eval $(dircolors ~/.dircolors)

# Misc. environment
HISTFILE="${XDG_STATE_HOME}/zsh/history"
mkdir -p "${HISTFILE:h}"
HISTSIZE=5000
LESS=-ifR
MAIL=/var/mail/$USER
SAVEHIST=5000
EDITOR=nvim
#EMAIL=user@host.de

# Export environment
export EDITOR LESS EMAIL

# Load colors (eg: $fg[red])
autoload colors; colors;

# set umask to normal permissions
umask 022



# Maintain a directory stack of 20 entries (accessible with ~- and
# ~+), and automatically push directories when cd'ing into them.  The
# pushdminus option makes ~- relative to the top of the stack, instead
# of the other way around.
DIRSTACKSIZE=20
setopt autopushd
setopt pushdminus

# Extended globbing (which is nice for doing stuf like "print -l
# **/*~*.ogg" which prints all files not matching *.ogg.
setopt extendedglob

##
# Command history options

# Share history file between different zsh sessions.
setopt sharehistory

# History entries are written immediately.
setopt inc_append_history

# Perform substitutions in the prompt.
setopt promptsubst

# Set the terminal title:
# - When no program is running, set it to the current
#   working directory. If it is a git repo, also show the git icon.
# - When a command is started, set it to the name of the command.

prompt_title_precmd() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
		icon=" "
  fi
  print -Pn "\e]0;%~$icon\a"
}

prompt_title_preexec() {
  print -Pn "\e]0;$1\a"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_title_precmd
add-zsh-hook preexec prompt_title_preexec

