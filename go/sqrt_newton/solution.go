package main

import "fmt"
import "math"

func sqrt(x, e float64) float64 {
	max_iterations := 1000
	p0 := x / 2.0
	for i := 0; i < max_iterations; i++ {
		p := p0 - (p0*p0 - x)/(2*p0)
		if math.Abs(p - p0) < e {
			return p
		}
		p0 = p
	}
	return p0
}

func assert_close(x, y, e float64) {
	if math.Abs(x - y) > e {
		fmt.Println("x: %v, y: %v", x, y)
		panic("x != y")
	}
}

func main() {
	assert_close(sqrt(2, 0.01), 1.416, 0.01)
}
