package main

import (
	"fmt"
)

type Node struct {
	Next *Node
}

func DetectLoop(head *Node) *Node {
	fast := head
	slow := head

	for fast != nil && fast.Next != nil {
		fast = fast.Next.Next
		slow = slow.Next
		if fast == slow {
			break
		}
	}

	if fast == nil || fast.Next == nil {
		return nil
	}

	from_head := head
	from_fast := fast

	for from_head != from_fast {
		from_head = from_head.Next
		from_fast = from_fast.Next
	}

	return from_head
}



func main() {
	if DetectLoop(nil) != nil {
		panic("DetectLoop(nil) != nil")
	}

	if DetectLoop(&Node{}) != nil {
		panic("DetectLoop(&Node{}) != nil")
	}

	{
		l := &Node{}
		l.Next = l
		if DetectLoop(l) != l {
			panic("DetectLoop(l) != l")
		}
	}

	{
		l := &Node{&Node{}}
		l.Next.Next = l
		if DetectLoop(l) != l {
			panic("DetectLoop(l) != l")
		}
	}

	{
		l := &Node{&Node{}}
		l.Next.Next = l.Next
		if DetectLoop(l) != l.Next {
			panic("DetectLoop(l) != l.Next")
		}
	}

	{
		l := &Node{&Node{&Node{}}}
		l.Next.Next.Next = l.Next
		if DetectLoop(l) != l.Next {
			panic("DetectLoop(l) != l.Next")
		}
	}

	fmt.Printf("All tests passed!\n")
}

