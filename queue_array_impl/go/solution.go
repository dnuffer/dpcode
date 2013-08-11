package main

import "fmt"

// TODO: implement a queue with a dynamicly sized ring-buffer storage.
type Queue struct {
	buffer []int
	begin, length int
}

func (queue *Queue) PushBack(data int) {
	queue.ensureAvailable(1)
	pos := queue.begin + queue.length
	if pos >= len(queue.buffer) {
		pos -= len(queue.buffer)
	}
	queue.buffer[pos] = data
	queue.length++
}

func (queue *Queue) PopFront() (result int) {
	if queue.Empty() {
		return 0
	}

	result = queue.buffer[queue.begin]
	queue.length--
	queue.begin++
	if queue.begin >= len(queue.buffer) {
		queue.begin = 0
	}
	return
}

func (queue *Queue) Empty() bool {
	return queue.Len() == 0
}

func (queue *Queue) Len() int {
	return queue.length
}

func (queue *Queue) ensureAvailable(available int) {
	//fmt.Println(len(queue.buffer), queue.length, available)
	if queue.buffer == nil {
		to_allocate := available
		if to_allocate < 16 {
			to_allocate = 16
		}
		queue.buffer = make([]int, to_allocate)
		queue.begin = 0
		queue.length = 0
	} else if len(queue.buffer) < queue.length + available {
		//fmt.Println("Growing buffer")
		new_buffer := make([]int, (queue.length + available) * 3/2)
		if queue.begin + queue.length < len(queue.buffer) {
			copy(new_buffer, queue.buffer[queue.begin:queue.begin + queue.length])
		} else {
			// 2 parts, wrapped
			p1begin := queue.begin
			p1len := len(queue.buffer) - p1begin
			p2begin := 0
			p2len := queue.length - p1len
			// copy p1 to the start of new_buffer
			copy(new_buffer, queue.buffer[p1begin:p1begin + p1len])
			// append p2 to new_buffer
			copy(new_buffer[p1len:len(new_buffer)], queue.buffer[p2begin:p2begin + p2len])
		}
		queue.buffer = new_buffer
		queue.begin = 0
	}
}

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

