#
# █▀▀ █▀█ █▀▄▀█ █▀█ █░░ █▀▀ ▀█▀ █ █▀█ █▄░█
# █▄▄ █▄█ █░▀░█ █▀▀ █▄▄ ██▄ ░█░ █ █▄█ █░▀█
#
# Loaded from `zshrc.zsh`.

# Enable compsys completion
autoload -U compinit

# Complete in the middle and end of words as well as in the beginning,
# and make completions case insensitive.
zstyle ':completion:*' matcher-list '' 'l:|=* r:|=*' 'r:|[._-/]=* r:|=*' 'm:{a-zA-Z}={A-Za-z}'

# Cache completions
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' cache-path ~/.zsh/$HOST

# do not remove slash if argument is a directory
zstyle ':completion:*' squeeze-slashes false

# history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Separate different types of completions (for example, users and hosts)
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%BCompletion options for %d:%b'

# Use the standard ls colors in completions
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Be able to select completions by cursor
zstyle ':completion:*' menu select=1

# approximation
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# ssh, scp, ping, host
test ! -d "$HOME/.ssh" && mkdir "$HOME/.ssh"
test ! -f "$HOME/.ssh/known_hosts" && touch "$HOME/.ssh/known_hosts"
test ! -f "$HOME/.ssh/config" && touch "$HOME/.ssh/config"

zstyle ':completion:*:(scp|rsync):*' tag-order \
        'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order \
        users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
        users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order \
        hosts-domain hosts-host users hosts-ipaddr
 
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns \
        '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns \
        '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns \
        '^<->.<->.<->.<->' '127.0.0.<->'
zstyle ':completion:*:(ssh|scp|rsync):*:users' ignored-patterns \
        adm bin daemon halt lp named shutdown sync
 
zstyle -e ':completion:*:(ssh|scp|ping|host|nmap|rsync):*' hosts 'reply=(
        ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
                        /dev/null)"}%%[#| ]*}//,/ }
        ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
        ${=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
        )'

