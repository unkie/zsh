#
# █▀█ █▀█ █▀█ █▀▄▀█ █▀█ ▀█▀
# █▀▀ █▀▄ █▄█ █░▀░█ █▀▀ ░█░
#
# Loaded from `zshrc.zsh`.

# Setup the prompt using starship
function starship_prompt () {
	eval "$(starship init zsh)"
}

# Setup a basic prompt with git info
function basic_prompt () {
	# Source the lib with the git_prompt_info function
	source $ZDOTDIR/lib/git.zsh

	local _smiley="%(?,%#,%{$fg[red]%}%#%{$reset_color%})"

	# Prompt (default prompt: [user@hostname dir]#)
	export PROMPT='[%n@%m %d% $(git_prompt_info)]${_smiley} '
	# Continuation prompt.
	export PS2='[%_] '

	setopt prompt_subst
	# For git
	ZSH_THEME_GIT_PROMPT_PREFIX="("
	ZSH_THEME_GIT_PROMPT_SUFFIX=")"
	ZSH_THEME_GIT_PROMPT_DIRTY="*"
}

if (( $+commands[starship])); then
	starship_prompt
else
	basic_prompt
fi

# The prompt starts on the bottom of the window.
printf '\n%.0s' {0..`expr $LINES - 2`}

