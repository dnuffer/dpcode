package main

import "fmt"

func abs(x int) int {
	if x < 0 {
		return -x
	}
	return x
}

// TODO: write gcd using Euclid's algorithm

func assert_equal(value, expected int) {
	if value != expected {
		panic(fmt.Sprintf("expected %v, got %v\n", expected, value))
	}
}

func main() {
	assert_equal(0 ,gcd(0, 0))
	assert_equal(10 ,gcd(0, 10))
	assert_equal(11 ,gcd(11, 0))
	assert_equal(5 ,gcd(0, -5))
	assert_equal(34 ,gcd(40902, 24140))
	assert_equal(34 ,gcd(40902, -24140))
	assert_equal(34 ,gcd(-40902, 24140))
	assert_equal(34 ,gcd(-40902, -24140))
	assert_equal(34 ,gcd(24140, 40902))
	assert_equal(34 ,gcd(24140, -40902))
	assert_equal(34 ,gcd(-24140, 40902))
	assert_equal(34 ,gcd(-24140, -40902))
	assert_equal(21 ,gcd(1071, 462))
}
