package main

import (
	"fmt"
)

func main() {
	// TODO: fill in primes
	curPrime := 3;

	for i := 1; i < 100; i++ {
		for !primes[curPrime] {
			curPrime++
		}
		fmt.Printf(",%d", curPrime)
		curPrime++
	}
}
