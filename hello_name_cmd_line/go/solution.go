package main

import "fmt"
import "github.com/jessevdk/go-flags"
import "os"

func main() {
	var opts struct {
		Name string `short:"n" long:"name" description:"Use NAME to greet someone" required:true`
	}

	_, err := flags.Parse(&opts)

	if err != nil && err.(*flags.Error).Type == flags.ErrHelp {
		os.Exit(0)
	}

	if err != nil || opts.Name == "" {
		fmt.Fprintf(os.Stderr, "scratch: Invalid command line arguments\n")
		fmt.Fprintf(os.Stderr, "Try `scratch --help' for more information.\n")
		os.Exit(1)
	}

	fmt.Printf("Hello, %s\n", opts.Name)
}
