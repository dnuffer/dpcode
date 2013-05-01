package main

import "fmt"

// TODO: implement MapReduce

func counter(in_str interface{}, output chan interface{}) {
	output <- len(in_str.(string))
}

func summer(input chan interface{}, output chan interface{}) {
	total := 0
	for count := range input {
		total += count.(int)
	}
	output <- total
}

func output_strings() chan interface{} {
	output := make(chan interface{})
	go func() {
		output <- "hello"
		output <- "world"
		close(output)
	}()
	return output
}

func TestMapReduce() {
	fmt.Println(MapReduce(counter, summer, output_strings(), 20))
}

func main() {
	TestMapReduce()
}
