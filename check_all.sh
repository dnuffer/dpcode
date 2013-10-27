#!/bin/bash

set -e
set -u
set -x

#dirs_to_check=$(find . -name solution.\* -size +1b | xargs -n 1 dirname | sort | uniq)
dirs_to_check()
{
	find . -name solution.\* -size +1b | xargs -n 1 dirname | sort | uniq | grep -v scala
	#find . -name solution.\* -size +1b | xargs -n 1 dirname | sort | uniq
}

echo "$(dirs_to_check)"

list_make_targets()
{
	make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
}

have_make_target()
{
	list_make_targets | grep -q "$1" 2>/dev/null
}

dirs_to_check | while read -r dir_to_check; do
	echo "Checking $dir_to_check"
	pushd $dir_to_check
	if have_make_target clean; then
		make clean
	fi
	if have_make_target check-solution; then
		if ! make check-solution; then
			echo "Dir $dir_to_check failed!"
			exit 1;
		else
			echo "Dir $dir_to_check passed!"
		fi
	else
		echo "Dir $dir_to_check doesn't have check-solution!"
		exit 1
	fi
	popd
done
