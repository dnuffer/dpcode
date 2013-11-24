package main

import (
	. "launchpad.net/gocheck"
)

func determine_sequence_removals(first, second map[int]bool) (removals map[int]bool) {
	removals = make(map[int]bool)
	for key, _ := range(first) {
		_, present := second[key]
		if !present {
			removals[key] = true
		}
	}
	return
}

func main() {
	c := C{}
	c.Assert(determine_sequence_removals(map[int]bool {1:true, 2:true, 3:true}, map[int]bool {1:true, 2:true}), DeepEquals, map[int]bool {3:true})
}
