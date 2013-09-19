#!/bin/bash


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
	assert_maximum_weighted_subset "(1 2 4)" 7 7
	assert_maximum_weighted_subset "(3 5 7)" 6 5
}

main "$@"
