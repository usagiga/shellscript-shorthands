#!/bin/bash

set -euo pipefail

# script.sh [-h]
# Shell script template

# Main routine
#
# Arguments:
#   None
# Return values:
#   None
# Exit codes:
#   0: Always
function usage() {
	echo "Usage: $0 [-x] [-y STRING]"
	# To parse escape sequence, wrap cat with echo
	echo -e "$(cat <<- EOS

		Test reading commandline args and show usage

		\t-x\tSome flags
		\t-y\tSome string
	EOS
	)"
}

# Template for reading commandline arguments
#
# Arguments:
#   Must be `$@` inherited from global
# Return values:
#   None
# Exit codes:
#   0: Success
#	1: Required args aren't specified
function read_cmd_args {
	local OPTIND OPTARG
	while getopts xy: option
    do
      case $option in
        x)
          VAR_X='Specified X'
	  	;;
        y)
          VAR_Y=${OPTARG:-Specified}
        ;;
        \?)
          usage
          exit 1
      esac
    done

    return 0
}

# Main routine
#
# Arguments:
#   Must be `$@` inherited from global
# Return values:
#   None
# Exit codes:
#   0: Always
function main() {
	local VAR_X VAR_Y
	read_cmd_args "$@"
	echo "X: ${VAR_X:-}, Y: ${VAR_Y:-}"
}

main "$@"
