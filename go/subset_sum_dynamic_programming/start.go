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
	assert_equal(maximum_weighted_subset([]int {1, 3, 6}, 9), 9)
	assert_equal(maximum_weighted_subset([]int {1, 3, 6}, 8), 7)
}
