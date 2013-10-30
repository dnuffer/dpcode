package main

import "fmt"

type queueNode struct {
	nextNode *queueNode
	data int
}

type Queue struct {
	Front, Back *queueNode
}

func (queue *Queue) PushBack(data int) {
	if queue.Front == nil {
		queue.Back = &queueNode { nil, data }
		queue.Front = queue.Back
	} else {
		queue.Back.nextNode = &queueNode{ nil, data }
		queue.Back = queue.Back.nextNode
	}
}

func (queue *Queue) PopFront() (result int) {
	result = queue.Front.data
	queue.Front = queue.Front.nextNode
	return
}

func (queue *Queue) Empty() bool {
	return queue.Front == nil
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
	for i := 1; i < 10000; i++ {
		for j := 0; j < i; j++ {
			//fmt.Printf("PushBack(%d)\n", in)
			queue.PushBack(in)
			//fmt.Printf("%+v\n", queue)
			in++
		}
		//fmt.Printf("PopFront(), expecting %d\n", out)
		x := queue.PopFront()
		//fmt.Printf("%+v\n", queue)
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

