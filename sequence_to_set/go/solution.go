package main

import (
	"fmt"
)

func ToMap(in []int) (result map[int] struct{}) {
	result = make(map[int] struct{})
	for x := range in {
		result[x] = struct{}{}
	}
	return result
}

func main() {
	array := []int{7, 8, 9}
	am := ToMap(array)
	if len(am) != 3 {
		panic("size(am) != 3")
	}
	fmt.Printf("All tests passed!")
}
