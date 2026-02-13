#
# █▄▀ █▀▀ █▄█ █▀▀ █░█ ▄▀█ █ █▄░█
# █░█ ██▄ ░█░ █▄▄ █▀█ █▀█ █ █░▀█
#
# Keychain management.


function keychain_setup {
	# Keys/identities to load on linux.
	local -a linux_identities=(
		#private.key
		#id_ed25519
	)

	# Keys/identities to load on macOS.
	local -a macos_identities=(
		#private.key
	)

	# Setup function for linux.
	local linux_setup
	linux_setup() {
		(( $+commands[keychain] )) || return
		(( ${#linux_identities} )) || return

		local keychain_dir="${XDG_CACHE_HOME}/keychain"

		keychain \
			--quiet \
			--dir "$keychain_dir" \
			--systemd \
			--host "$HOST" \
			${^linux_identities}

		local env_sh="$keychain_dir/$HOST-sh"
		local env_sh_gpg="$keychain_dir/$HOST-sh-gpg"

		# Source environment settings.
		[ -f "$env_sh" ] && . "$env_sh"
		[ -f "$env_sh_gpg" ] && . "$env_sh_gpg"
	}


	# Setup function for macOS.
	local macos_setup
	macos_setup() {
		(( $+commands[ssh-add] )) || return
		(( ${#macos_identities} )) || return
		ssh-add ${^linux_identities}
	}


	# Setup keychain depending on OS.
	case "$OSTYPE" in
		linux*) linux_setup;;
		darwin*) macos_setup;;
	esac

}

keychain_setup

