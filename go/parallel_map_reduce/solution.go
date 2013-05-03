package main

import "fmt"

type Pair struct {
	Key interface{}
	Value interface{}
}

// This implementation is missing the shuffle step where the keys from the map
// step are sorted and aggregated before reducing. The reason is that the builtin
// map class has no ability to customize the comparison so we can't write a
// generic version that uses interface{} variables.
func MapReduce(mapper func(in_data Pair) Pair,
		reducer func(input chan Pair, output chan interface{}),
		input chan Pair,
		pool_size int) []interface{} {
	// written to by mapper goroutines, read by reducer
	reducer_input := make(chan Pair, pool_size)

	// written to by reducer, read by MapReduce for return value
	reducer_output := make(chan interface{})

	// written to by mapper goroutines, read by await mapper completion goroutine 
	// so it knows when it is safe to close reducer_input
	done := make(chan struct{}, pool_size)

	// reducer goroutine simply reads from input and writes result to output
	go func() {
		reducer(reducer_input, reducer_output)
		close(reducer_output)
	}()

	// await mapper completion goroutine. once all the mapper workers are done, 
	// close reducer_input
	go func() {
		for i := 0; i < pool_size; i++ {
			<-done
		}
		close(reducer_input)
	}()

	// mapper goroutines
	for i := 0; i < pool_size; i++ {
		go func() {
			for item := range input {
				reducer_input <- mapper(item)
			}
			done <- struct{}{}
		}()
	}
	result := []interface{}{}
	for item := range reducer_output {
		result = append(result, item)
	}
	return result
}

func counter(in_str Pair) Pair {
	return Pair{in_str.Key, len(in_str.Key.(string))}
}

func summer(input chan Pair, output chan interface{}) {
	total := 0
	for count := range input {
		total += count.Value.(int)
	}
	output <- total
}

func output_strings() chan Pair {
	output := make(chan Pair)
	go func() {
		for i := 0; i < 1; i++ {
			output <- Pair{"hello", nil}
			output <- Pair{"world", nil}
			output <- Pair{"Dan", nil}
			output <- Pair{"is", nil}
			output <- Pair{"awesome", nil}
		}
		close(output)
	}()
	return output
}

func TestMapReduce() {
	fmt.Println(MapReduce(counter, summer, output_strings(), 4))
}

func main() {
	TestMapReduce()
}
