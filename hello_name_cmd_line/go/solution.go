package main

import "fmt"

func main() {
	var name string
	num, err := fmt.Scan(&name)
	if num != 1 || err != nil {
		fmt.Printf("No name given")
	} else {
		fmt.Printf("Hello, %s\n", name)
	}
}
