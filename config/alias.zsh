#
# ▄▀█ █░░ █ ▄▀█ █▀ █▀ █▀▀ █▀
# █▀█ █▄▄ █ █▀█ ▄█ ▄█ ██▄ ▄█
#
# Loaded from `zshrc.zsh`.

# Default options for commands

alias cp="cp -i"
alias mv="mv -i"
alias diff="diff -u"
alias si="sudo -E env 'XDG_CONFIG_HOME=$XDG_CONFIG_HOME' nvim"
alias grep="grep -E --color"
alias vimdiff="nvim -d"

if (( $macos )); then
	alias ls="ls -p -G"
	alias ll="ls -p -G -la"
	alias lsd="ls -p -G -ctrl"
else # if (( $linux ));
	alias ls="ls -p --color --quoting-style=shell"
	alias ll="ls -p -la --color"
	alias lsd="ls -p --color --quoting-style=shell -ctrl"
fi

# List empty files
alias ls0="ls **/*(L0)"

#alias thee="echo 'echo The tea is ready... | mail max@mustermensch.de' | at now + 4 minutes"
alias vi="nvim"
alias seedbox='ssh -p 29 seedbox'
alias ex="~/scripts/extract.sh"
alias pwgen="pwgen -cny 16"
alias leafpad="l3afpad"

# moving around
alias -- ..='cd ..'
alias -- cd..='cd ..'
alias -- cdwd='cd "`pwd`"'

# implemented as function because alias doesn't work
mkcd () { mkdir -p $1 && cd $1 }
ff () { find . -name $1 -print }

