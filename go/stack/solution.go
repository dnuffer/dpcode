package main

type StackNode struct {
	NextNode *StackNode
	Data interface{}
}

type Stack struct {
	Top *StackNode
}

func (stack *Stack) Push(data interface{}) {
	stack.Top = &StackNode{ stack.Top, data }
}

func (stack *Stack) Pop() (result interface{}) {
	result = stack.Top.Data
	stack.Top = stack.Top.NextNode
	return
}

func (stack *Stack) Empty() bool {
	return stack.Top == nil
}

func main() {
	stack := new(Stack)
	if !stack.Empty() {
		panic("!stack.Empty()")
	}
	stack.Push(1)
	stack.Push(2)
	stack.Push(3)
	if stack.Empty() {
		panic("stack.Empty()")
	}

	if stack.Pop() != 3 {
		panic("stack.Pop() != 3")
	}
	if stack.Pop() != 2 {
		panic("stack.Pop() != 2")
	}
	if stack.Pop() != 1 {
		panic("stack.Pop() != 1")
	}
	if !stack.Empty() {
		panic("!stack.Empty()")
	}
}

