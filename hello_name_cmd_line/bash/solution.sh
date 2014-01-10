#!/bin/bash
TEMP=`getopt -o -n:h --long name:,help -n 'solution' -- "$@"`

if [ $? != 0 ]; then echo "Try \`solution --help' for more information." >&2; exit 1; fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$TEMP"

NAME=
SHOW_HELP="no"
while true; do
	case "$1" in
		--name|-n ) NAME="$2"; shift 2;;
		--help|-h ) SHOW_HELP="yes"; shift;;
		-- ) shift; break;;
		-*) echo "solution: error - unrecognized option $1" 1>&2; echo "Try \`solution --help' for more information" 1>&2; exit 1;;
		* ) break;;
	esac
done

if [ "${SHOW_HELP}" = "yes" ]; then
	echo "Usage: solution [options]"
	echo "  --name, -n {NAME}    Show to a greeting to {NAME}"
	echo "  --help, -h           Display a help message"
	exit 0
fi

if [ "z${NAME}" = "z" ]; then 
	echo "solution: Name not specified" >&2
	echo "Try \`solution --help' for more information." >&2
	exit 1
fi

echo "Hello, ${NAME}"
