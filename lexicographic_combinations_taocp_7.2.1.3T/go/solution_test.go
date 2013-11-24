package solution_test

import (
	. "launchpad.net/gocheck"
	"testing"
	"."
)

// Hook up gocheck into the "go test" runner.
func Test(t *testing.T) { TestingT(t) }


type MySuite struct{}
var _ = Suite(&MySuite{})

func (s *MySuite) TestCombinationsGenerator2_1(c *C) {
	gen := solution.New(2, 1)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator3_1(c *C) {
	gen := solution.New(3, 1)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{2})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator3_2(c *C) {
	gen := solution.New(3, 2)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 1})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 2})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1, 2})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator4_1(c *C) {
	gen := solution.New(4, 1)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{2})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{3})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator4_2(c *C) {
	gen := solution.New(4, 2)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 1})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 2})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1, 2})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 3})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1, 3})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{2, 3})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator4_3(c *C) {
	gen := solution.New(4, 3)
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 1, 2})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 1, 3})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{0, 2, 3})
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, []uint{1, 2, 3})
	c.Assert(gen.HasNext(), Equals, false)
}

func (s *MySuite) TestCombinationsGenerator1000_999(c *C) {
	var lim uint = 1000
	gen := solution.New(lim, lim - 1)
	expected := make([]uint, lim - 1)
	for i := uint(0); i < lim - 1; i++ {
		expected[i] = i
	}
	c.Assert(gen.HasNext(), Equals, true)
	c.Assert(gen.Next(), DeepEquals, expected)
	for i := uint(1); i < lim; i++ {
		c.Assert(gen.HasNext(), Equals, true)
		expected[lim - i - 1]++
		c.Assert(gen.Next(), DeepEquals, expected)
	}
	c.Assert(gen.HasNext(), Equals, false)
}

