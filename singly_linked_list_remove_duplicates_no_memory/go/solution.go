package main

import "fmt"

type Node struct {
	Next *Node
	Data int
}

func remove_duplicates(node *Node) (result *Node) {
	result = node

	n1 := node
	for (n1 != nil) {
		prev := n1
		n2 := n1.Next
		for (n2 != nil) {
			if (n1.Data == n2.Data) {
				prev.Next = n2.Next
			} else {
				prev = n2
			}
			n2 = n2.Next
		}
		n1 = n1.Next
	}
	return
}

func assert_equals(node *Node, expected []int) {
	cn := node
	i := 0
	for (cn != nil && i < len(expected)) {
		if (cn.Data != expected[i]) {
			panic(fmt.Sprintf("expected %d, got %d", expected[i], cn.Data))
		}
		cn = cn.Next
		i++
	}
	if (cn != nil) {
		panic(fmt.Sprintf("list contained more items than expected: %d at idx %d", cn.Data, i))
	}
	if (i < len(expected)) {
		panic(fmt.Sprintf("list contained fewer items than expected: %d at idx %d", expected[i], i))
	}
}

func main() {
	l1 := &Node{nil, 1}
	assert_equals(l1, []int{1})
	assert_equals(remove_duplicates(l1), []int{1})

	l2 := &Node{&Node{nil, 2}, 1}
	assert_equals(l2, []int{1, 2})
	assert_equals(remove_duplicates(l2), []int{1, 2})

	l2d := &Node{&Node{nil, 2}, 2}
	assert_equals(l2d, []int{2, 2})
	assert_equals(remove_duplicates(l2d), []int{2})

	l5d := &Node{&Node{&Node{&Node{&Node{nil, 5}, 0}, 4}, 0}, 3}
	assert_equals(l5d, []int{3, 0, 4, 0, 5})
	assert_equals(remove_duplicates(l5d), []int{3, 0, 4, 5})

	l7d := &Node{&Node{&Node{&Node{&Node{&Node{&Node{nil, 0}, 5}, 0}, 4}, 0}, 3}, 0}
	assert_equals(l7d, []int{0, 3, 0, 4, 0, 5, 0})
	assert_equals(remove_duplicates(l7d), []int{0, 3, 4, 5})

	l7d2 := &Node{&Node{&Node{&Node{&Node{&Node{&Node{nil, 0}, 5}, 0}, 5}, 0}, 5}, 0}
	assert_equals(l7d2, []int{0, 5, 0, 5, 0, 5, 0})
	assert_equals(remove_duplicates(l7d2), []int{0, 5})

}


