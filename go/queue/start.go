package main

// TODO: Write Queue with PushBack(), PopFront() and Empty()

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
}

