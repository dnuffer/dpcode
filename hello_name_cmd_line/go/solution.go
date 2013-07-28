package main

import "fmt"
import "flag"

func main() {
	var name string
	flag.StringVar(&name, "name", "", "set the name")
	flag.Parse()
	if name == "" {
		panic("Name not specified")
	}
	fmt.Printf("Hello, %s\n", name)
}

