# We want sbin in our path
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin

# Set colors for `ls'.
eval $(dircolors ~/.dircolors)

# Misc. environment
mkdir -p "${HISTFILE:h}"
LESS=-ifR
MAIL=/var/mail/$USER
EDITOR=nvim
#EMAIL=user@host.de

# History
HISTFILE="${XDG_STATE_HOME}/zsh/history"
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

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

# Perform substitutions in the prompt.
setopt promptsubst

