package main

import "fmt"

// TODO: implement a queue with a dynamicly sized ring-buffer storage.

func main() {
	queue := new(Queue)
	if !queue.Empty() {
		panic("!queue.Empty()")
	}
	queue.PushBack(1)
	queue.PushBack(2)
	queue.PushBack(3)
	if queue.Empty() {
		panic("queue.Empty()")
	}

	if queue.PopFront() != 1 {
		panic("queue.PopFront() != 1")
	}
	if queue.PopFront() != 2 {
		panic("queue.PopFront() != 2")
	}
	if queue.PopFront() != 3 {
		panic("queue.PopFront() != 3")
	}
	if !queue.Empty() {
		panic("!queue.Empty()")
	}
	queue.PushBack(4)
	if queue.Empty() {
		panic("queue.Empty()")
	}
	if queue.PopFront() != 4 {
		panic("queue.PopFront() != 4")
	}

	in := 0
	out := 0
	for i := 1; i < 100; i++ {
		for j := 0; j < i; j++ {
			queue.PushBack(in)
			in++
		}
		x := queue.PopFront()
		if (x != out) {
			panic(fmt.Sprintf("queue.PopFront() != %d, got %d", out, x))
		}
		out++
	}
	for !queue.Empty() {
		x := queue.PopFront()
		if (x != out) {
			panic(fmt.Sprintf("queue.PopFront() != %d, got %d", out, x))
		}
		out++
	}
}

