package main

import "fmt"

func max(x, y int) int {
	if x > y {
		return x
	}
	return y
}

func maximum_weighted_subset(weights []int, bound int) int {
	if (len(weights) == 0) {
		return 0
	}

	maxWeights := make([]int, bound + 1)

	for w := weights[0]; w <= bound; w++ {
		maxWeights[w] = weights[0]
	}

	for i := 1; i < len(weights); i++ {
		for w := bound; w >= 0; w-- {
			if weights[i] <= w {
				include := weights[i] + maxWeights[w - weights[i]]
				exclude := maxWeights[w]
				maxWeights[w] = max(include, exclude)
			}   
		}   
	}

	return maxWeights[bound]
}

func assert_equal(x, y int) {
	if x != y {
		panic(fmt.Sprintf("not equal: %d and %d", x, y))
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
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 7), 7)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 6), 6)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 5), 5)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 4), 4)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 3), 3)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 2), 2)
	assert_equal(maximum_weighted_subset([]int {4, 2, 1}, 1), 1)
	assert_equal(maximum_weighted_subset([]int {3, 5, 7}, 6), 5)
	fmt.Printf("All tests passed!\n")
}
