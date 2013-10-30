package main

// TODO: Write Stack with Push(), Pop() and Empty()

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

