#!/bin/bash
TEMP=`getopt -o n: --long name: -n 'solution.sh' -- "$@"`

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

# Note the quotes around `$TEMP': they are essential!
eval set -- "$TEMP"

NAME=
while true; do
  case "$1" in
    --name ) NAME="$2"; shift 2 ;;
    -- ) shift; break ;;
    -*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    * ) break ;;
  esac
done

if [ "z${NAME}" = "z" ]; then echo "Name not specified" >&2; exit 1; fi

echo "Hello, ${NAME}"
