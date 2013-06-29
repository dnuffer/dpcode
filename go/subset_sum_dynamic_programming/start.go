package main

func max(x, y int) int {
	if x > y {
		return x
	}
	return y
}

// TODO: write maximum_weighted_subset
// Input:
//   weights: A list of non-negative integral weights.
//	  W: A non-negative integral weight bound.
// Output:
//   The maximum weight of any valid subset of weights.
//   A valid subset is one with total weight at most W.


func assert_equal(x, y int) {
	if x != y {
		panic("not equal")
	}
}

func main() {
	assert_equal(maximum_weighted_subset([]int {}, 9), 0)
	assert_equal(maximum_weighted_subset([]int {1, 3, 6}, 9), 9)
	assert_equal(maximum_weighted_subset([]int {1, 3, 6}, 8), 7)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 7), 6)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 6), 6)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 5), 5)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 4), 4)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 3), 3)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 2), 2)
	assert_equal(maximum_weighted_subset([]int {1, 2, 3}, 1), 1)
	assert_equal(maximum_weighted_subset([]int {1, 2, 4}, 7), 7)
	assert_equal(maximum_weighted_subset([]int {3, 5, 7}, 6), 5)
}
