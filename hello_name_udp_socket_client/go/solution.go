package main

import (
	"net";
	"os";
	"fmt";
)

func main() {
	name := os.Args[1]
	conn, _ := net.Dial("udp", "localhost:9999")
	fmt.Fprintf(conn, "Hello, %s", name)
}
