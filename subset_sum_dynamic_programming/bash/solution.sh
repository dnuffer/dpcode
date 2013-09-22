#!/bin/bash

set -u

maximum_weighted_subset()
{
	if [ ${#weights[*]} -eq 0 ]; then
		echo "0"
		return
	fi

	for ((w = 0; w < ${weights[0]}; w++)); do
		maxWeights[w]=0
	done

	for ((w = ${weights[0]}; w <= bound; w++)); do
		maxWeights[w]=${weights[0]}
	done

	for ((i = 1; i < ${#weights[*]}; i++)); do
		for ((w = $bound; w >= 0; w--)); do
			if (( ${weights[i]} <= w )); then
				let include="${weights[i]} + ${maxWeights[w - ${weights[i]}]}"
				if (( include >= ${maxWeights[w]} )); then
					maxWeights[w]=$include
				fi
			fi
		done
	done

	echo "${maxWeights[bound]}"
}

assert_maximum_weighted_subset()
{
	eval "weights=$1"
	bound=$2
	expected=$3
	max=$(maximum_weighted_subset)
	[ "$max" == "$expected" ] || { 
		echo "With weights: (${weights[*]}) and bound: $bound"
		echo "Expected: $expected, actual: $max"
		exit 1
	}
}

main()
{
	assert_maximum_weighted_subset "()" 9 0
	assert_maximum_weighted_subset "(1 3 6)" 9 9
	assert_maximum_weighted_subset "(1 3 6)" 8 7
	assert_maximum_weighted_subset "(1 2 3)" 7 6
	assert_maximum_weighted_subset "(1 2 3)" 6 6
	assert_maximum_weighted_subset "(1 2 3)" 5 5
	assert_maximum_weighted_subset "(1 2 3)" 4 4
	assert_maximum_weighted_subset "(1 2 3)" 3 3
	assert_maximum_weighted_subset "(1 2 3)" 2 2
	assert_maximum_weighted_subset "(1 2 3)" 1 1
	assert_maximum_weighted_subset "(4 2 1)" 7 7
	assert_maximum_weighted_subset "(4 2 1)" 6 6
	assert_maximum_weighted_subset "(4 2 1)" 5 5
	assert_maximum_weighted_subset "(4 2 1)" 4 4
	assert_maximum_weighted_subset "(4 2 1)" 3 3
	assert_maximum_weighted_subset "(4 2 1)" 2 2
	assert_maximum_weighted_subset "(4 2 1)" 1 1
	assert_maximum_weighted_subset "(3 5 7)" 6 5
	echo "All tests passed!"
}

main "$@"
