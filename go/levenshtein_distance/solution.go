package main

import "fmt"

func min(x int, y int) int {
	if x < y {
		return x
	} else {
		return y
	}
	return x
}

func LevenshteinDistance(source string, target string) int {
	if source == "" {
		return len(target)
	} else if target == "" {
		return len(source)
	} else if source[0] == target[0] {
		return LevenshteinDistance(source[1:], target[1:])
	} else {
		return 1 + min(LevenshteinDistance(source, target[1:]),
				min(LevenshteinDistance(source[1:], target[1:]),
				    LevenshteinDistance(source[1:], target)))
	}
	return 0
}

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
