package main

import "fmt"

func pascal(x, y int) int {
	if x == 0 || x == y {
		return 1
	} else {
		return pascal(x - 1, y - 1) + pascal(x, y - 1)
	}
}

func main() {
	if pascal(0, 2) != 1 {
		panic("0,2")
	}
	if pascal(1,2) != 2 {
		panic("1,2")
	}
	if pascal(1,3) != 3 {
		panic("1,3")
	}

	fmt.Printf("All tests passed!\n")
}
