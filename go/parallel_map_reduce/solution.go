package main

import "fmt"

func MapReduce(mapper func(interface{}, chan interface{}),
		reducer func(chan interface{}, chan interface{}),
		input chan interface{},
		pool_size int) interface{} {
	reducer_input := make(chan interface{})
	reducer_output := make(chan interface{})
	running_mapper_worker_chans := make(chan chan interface{}, pool_size)
	go reducer(reducer_input, reducer_output)
	go func() {
		for mapper_worker_output := range running_mapper_worker_chans {
			reducer_input <- <-mapper_worker_output
		}
		close(reducer_input)
	}()
	go func() {
		for item := range input {
			mapper_worker_output := make(chan interface{})
			go mapper(item, mapper_worker_output)
			running_mapper_worker_chans <- mapper_worker_output
		}
		close(running_mapper_worker_chans)
	}()
	return <-reducer_output
}

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
