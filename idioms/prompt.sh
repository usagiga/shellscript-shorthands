#!/bin/bash

set -euo pipefail

# Show prompt string
#
# Arguments:
#   1. Prompt string (any string)
#   2. Default behavior (`proceed` or `abort`)
# Return values:
#   none
# Exit codes:
#   0: User selected 'Yes'
#   1: User selected 'No' or emitted Keyboard Interrupt signal
function prompt() {
	# Get args
	local PROMPT DEFAULT
	PROMPT=$1;shift
	DEFAULT=${1:-proceed}

	# Show prompt
	local USER_INPUT
	if [[ ${DEFAULT} = 'proceed' ]]; then
		read -rp "${PROMPT} (Y/n): " USER_INPUT
		case ${USER_INPUT} in
			[nN]*)
				return 1;;
			*)
				return 0;;
		esac
	elif [[ ${DEFAULT} = 'abort' ]]; then
		read -rp "${PROMPT} (y/N): " USER_INPUT
		case ${USER_INPUT} in
			[yY]*)
				return 0;;
			*)
				return 1;;
		esac
	else
		while true
		do
			read -rp "${PROMPT} (y/n): " USER_INPUT
			case ${USER_INPUT} in
				[yY]*)
					return 0;;
				[nN]*)
    				return 1;;
			esac
		done
	fi
}

# Run example for prompt
#
# Arguments: none
# Return values: none
# Exit codes:
# - 0: always
function example() {
	if (prompt 'Proceed It?' 'abort'); then
		echo 'You Select "Yes"'
	else
		echo 'You Select "No"'
	fi
}

example
