package main

import "os"
import "fmt"
import "flag"

func main() {
	var name string
	var show_help bool
	flag.StringVar(&name, "name", "", "set name")
	flag.StringVar(&name, "n", "", "set name")
	flag.BoolVar(&show_help, "help", false, "show help")
	flag.Parse()
	if show_help {
		flag.Usage()
	} else if name == "" {
		fmt.Fprintf(os.Stderr, "Name not specified")
		os.Exit(1)
	} else {
		fmt.Printf("Hello, %s\n", name)
	}
}
