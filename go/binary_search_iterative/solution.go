package main

import "fmt"
import "math"

func BinarySearch(a []int, x int) int {
	low := 0
	high := len(a)
	for low < high {
		mid := int(math.Floor(float64(low + high) / 2.0))

		if x == a[mid] && (mid == 0 || x != a[mid - 1]) {
			return mid
		} else if x <= a[mid] {
			high = mid
		} else {
			low = mid + 1
		}
	}
	return -1
}

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
