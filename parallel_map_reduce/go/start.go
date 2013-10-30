package main

import "fmt"

type Pair struct {
	Key interface{}
	Value interface{}
}

// TODO: implement MapReduce


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
	counts := MapReduce(counter, summer, output_strings(), 4)
	fmt.Println(counts)
	if counts[0].(int) != 22 {
		panic(fmt.Sprintf("expected 22, got %d", counts[0].(int)))
	}
}

func main() {
	TestMapReduce()
}
