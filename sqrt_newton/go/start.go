package main

import "fmt"
import "math"

// TODO: write sqrt(x, e) using newton-rhapson


func assert_close(x, y, e float64) {
	if math.Abs(x - y) > e {
		fmt.Println("x: %v, y: %v", x, y)
		panic("x != y")
	}
}

func main() {
	assert_close(sqrt(2, 0.01), 1.416, 0.01)
}
