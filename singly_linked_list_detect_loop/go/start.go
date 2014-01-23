package main

import (
	"fmt"
)



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

