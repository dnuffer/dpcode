package main

type queueNode struct {
	nextNode *queueNode
	data interface{}
}

type Queue struct {
	Front, Back *queueNode
}

func (queue *Queue) PushBack(data interface{}) {
	if queue.Front == nil {
		queue.Back = &queueNode { nil, data }
		queue.Front = queue.Back
	} else {
		queue.Back.nextNode = &queueNode{ nil, data }
		queue.Back = queue.Back.nextNode
	}
}

func (queue *Queue) PopFront() (result interface{}) {
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
}

