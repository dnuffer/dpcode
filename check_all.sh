dirs_to_check=$(find . -name solution\* -size +1b | xargs -n 1 dirname | sort | uniq)

list_make_targets()
{
	make -qp | awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ {split($1,A,/ /);for(i in A)print A[i]}'
}

while read -r dir_to_check; do
	pushd $dir_to_check
	if list_make_targets | grep -q check-solution; then
		if ! make check-solution; then
			echo "Dir $dir_to_check failed!"
			break;
		fi
	fi
	popd
done <<< "$dirs_to_check"
