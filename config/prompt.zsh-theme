#
# █▀█ █▀█ █▀█ █▀▄▀█ █▀█ ▀█▀
# █▀▀ █▀▄ █▄█ █░▀░█ █▀▀ ░█░
#

# Setup the prompt using oh-my-posh
function posh_prompt () {
	eval "$(oh-my-posh init zsh --config ~/.config/zsh/config/oh-my-posh.json)"
}

# Setup the prompt using starship
function starship_prompt () {
	eval "$(starship init zsh)"
}

# Setup a basic prompt with git info
function basic_prompt () {
	ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[foam]%} "
	ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
	ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[gold]%}!"
	ZSH_THEME_GIT_PROMPT_CLEAN=""

	local _smiley="%(?,%{$fg[pine]%},%{$fg[love]%})%#%{$reset_color%}"
	export PROMPT='[$fg[iris]%n $fg[pine]%~$(_omz_git_prompt_info)]${_smiley} '
	export PS2='[%_] '
}

if (( $+commands[oh-my-posh] )); then
	posh_prompt
elif (( $+commands[starship] )); then
	starship_prompt
else
	basic_prompt
fi

# The prompt starts on the bottom of the window.
printf '\n%.0s' {1..$((LINES-2))}
