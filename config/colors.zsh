#
# █▀▀ █▀█ █░░ █▀█ █▀█ █▀
# █▄▄ █▄█ █▄▄ █▄█ █▀▄ ▄█
#
# Color palette aliasses for Rosé Pine

function {
	local -a rosepine=(
		overlay grey
		#underlay grey
		love red
		gold yellow
		rose cyan
		pine green
		foam blue
		iris magenta
	)

	local -a arrays=(
		fg fg_bold fg_no_bold
		bg bg_bold bg_no_bold
	)

	for array in ${^arrays}; do
		for k v in ${(@kv)rosepine}; do
			eval "${array}[$k]=\${${array}[$v]}"
		done
	done
}

