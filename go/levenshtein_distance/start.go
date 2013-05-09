package main

import "fmt"

func TestLevenshteinDistance() {
	if LevenshteinDistance("electron", "neutron") != 3 {
		panic(fmt.Sprintf("expected 3"))
	}
	if LevenshteinDistance("electron", "") != 8 {
		panic(fmt.Sprintf("expected 8"))
	}
	if LevenshteinDistance("", "neutron") != 7 {
		panic(fmt.Sprintf("expected 7"))
	}
	if LevenshteinDistance("electron", "electro") != 1 {
		panic(fmt.Sprintf("expected 1"))
	}
}

func main() {
	TestLevenshteinDistance()
}
