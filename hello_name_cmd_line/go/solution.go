package main

import "fmt"
import "flag"

func main() {
	var name string
	var help bool
	flag.BoolVar(&help, "help", false, "help")
	flag.StringVar(&name, "name", "", "set the name")
	flag.StringVar(&name, "n", "", "set the name")
	flag.Parse()
	if help {
		flag.Usage()
	} else if name == "" {
		panic("Name not specified")
	} else {
		fmt.Printf("Hello, %s\n", name)
	}
}

