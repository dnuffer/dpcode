package main

import (
	"fmt"
)


func main() {
	array := []int{7, 8, 9}
	am := ToMap(array)
	if len(am) != 3 {
		panic("size(am) != 3")
	}
	fmt.Printf("All tests passed!")
}
