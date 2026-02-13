#
# ▄▀█ █░░ █ ▄▀█ █▀ █▀ █▀▀ █▀
# █▀█ █▄▄ █ █▀█ ▄█ ▄█ ██▄ ▄█
#
# Command aliasses

alias cp="cp -i"
alias mv="mv -i"
alias diff="diff -u"
alias grep="grep -E --color"

alias vi="nvim"
alias vimdiff="nvim -d"
alias vd="nvim -d"

alias si="sudo -E env 'XDG_CONFIG_HOME=$XDG_CONFIG_HOME' nvim"

case "$OSTYPE" in
	linux*)
		alias ls="ls -p --color --quoting-style=shell"
		alias ll="ls -p -la --color"
		alias lsd="ls -p --color --quoting-style=shell -ctrl"
		;;
	darwin*)
		alias ls="ls -p -G"
		alias ll="ls -p -G -la"
		alias lsd="ls -p -G -ctrl"
		;;
esac

# List empty files
alias ls0="ls **/*(L0)"

#alias thee="echo 'echo The tea is ready... | mail max@mustermensch.de' | at now + 4 minutes"
alias seedbox='ssh -p 29 seedbox'
alias ex="~/scripts/extract.sh"
alias pwgen="pwgen -cny 16"
alias leafpad="l3afpad"

# Moving around
alias ..='cd ..'
alias cd..='cd ..'
alias cdwd='cd "`pwd`"'

# implemented as function because alias doesn't work
mkcd () { mkdir -p $1 && cd $1 }
ff () { find . -name $1 -print }

