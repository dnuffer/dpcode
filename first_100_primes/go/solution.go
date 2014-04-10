package main

import (
	"fmt"
)

func main() {
	primes := make([]bool, 1000)
	primes[0] = false;
	primes[1] = false;
	for i := 2; i < len(primes); i++ {
		primes[i] = true;
	}

	for i := 2; i < 100; i++ {
		for j := i * 2; j < 1000; j += i {
			primes[j] = false;
		}
	}

	fmt.Printf("2");
	curPrime := 3;

	for i := 1; i < 100; i++ {
		for !primes[curPrime] {
			curPrime++
		}
		fmt.Printf(",%d", curPrime)
		curPrime++
	}
}
