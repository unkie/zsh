#
# ▀█ █▀ █░█ █▀█ █▀█ █▀█ █▀▀ █ █░░ █▀▀
# █▄ ▄█ █▀█ █▀▀ █▀▄ █▄█ █▀░ █ █▄▄ ██▄
#
# Loaded when the shell is a login shell

# Determine the host system. This allows us to adapt to different operating systems.
KERNEL=$(uname -s)

if [ -z $KERNEL ]; then
	echo "WARNING: could not determine Kernel type, assuming linux." >&2
	KERNEL=linux
fi

case $KERNEL in
	Darwin) macos=1;;
	Linux|*) linux=1;;
esac

# This fixes many sdl based games with mouse jumping issues.
export SDL_MOUSE_RELATIVE=0

# SDL should use pulse for audio out
export SDL_AUDIODRIVER="pulse"

# Prevent wine front creating file associations and menu items.
export WINEDLLOVERRIDES='winemenubuilder.exe=d'

# Use GTK2 theme for QT5 and QT6
export QT_QPA_PLATFORMTHEME=qt6ct

# use this app to ask for a password
if [[ -x /usr/lib/ssh/gnome-ssh-askpass3 ]]; then
	export SSH_ASKPASS=/usr/lib/ssh/gnome-ssh-askpass3
fi

