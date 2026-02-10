#
# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █▀
# █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ ▄█
#
# Loaded from `zshrc.zsh`.

# Use vi keybindings with some additional modifications
bindkey -v

bindkey "" history-incremental-search-backward

# terminal specific bindings.
case $TERM in
	rxvt*)
		bindkey "[7~" beginning-of-line	# Home
		bindkey "[8~" end-of-line		# End
		bindkey "[5~" beginning-of-history	# PgUp
		bindkey "[6~" end-of-history		# PgDn
		bindkey "[2~" overwrite-mode		# Insert
		bindkey "[3~" delete-char		# Del
	;;
	screen*)
		bindkey "[1~" beginning-of-line	# Home
		bindkey "[4~" end-of-line		# End
		bindkey "[5~" beginning-of-history	# PgUp
		bindkey "[6~" end-of-history		# PgDn
		bindkey "[2~" overwrite-mode		# Insert
		bindkey "[3~" delete-char		# Del
	;;
	xterm*)
		bindkey '[H' beginning-of-line	# Home
		bindkey "[F" end-of-line		# End
		bindkey "[5~" beginning-of-history	# PgUp
		bindkey "[6~" end-of-history		# PgDn
		bindkey "[2~" overwrite-mode		# Insert
		bindkey "[3~" delete-char		# Del
	;;
esac
