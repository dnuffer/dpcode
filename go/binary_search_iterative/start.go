package main

import "fmt"
import "math"

// TODO: Write BinarySearch which returns the lowest index i such that arr[i] == x, or -1 if x not in arr



func TestBinarySearch() {
	if BinarySearch([]int{3, 4, 5, 5, 5, 5, 6}, 5) != 2 {
		panic(fmt.Sprintf("expected 2"))
	}

	if BinarySearch([]int{3, 4, 5, 5, 5, 5, 6}, 2) != -1 {
		panic(fmt.Sprintf("expected -1"))
	}

	if BinarySearch([]int{3, 4, 5, 5, 5, 5, 6}, 10) != -1 {
		panic(fmt.Sprintf("expected -1"))
	}
}

func main() {
	TestBinarySearch()
}
