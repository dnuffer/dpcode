package main

import "fmt"

// TODO: write PrimeFactorization

func equal(a, b []int) bool {
    for i := 0; i < len(a) && i < len(b); i++ {
        if a[i] != b[i] {
            return false
        }
    }
    if len(a) != len(b) {
        return false
    }
    return true
}
func main() {
	fmt.Printf("%v\n", PrimeFactorization(100))
	fmt.Printf("%v\n", PrimeFactorization(101))
	if !equal(PrimeFactorization(100), []int{2, 2, 5, 5}) {
		panic("PrimeFactorization(100)")
	}
	if !equal(PrimeFactorization(101), []int{101}) {
		panic("PrimeFactorization(101)")
	}
}
