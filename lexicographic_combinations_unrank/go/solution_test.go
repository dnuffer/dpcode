package solution_test

import (
	. "launchpad.net/gocheck"
	"testing"
	. "."
)

// Hook up gocheck into the "go test" runner.
func Test(t *testing.T) { TestingT(t) }


type MySuite struct{}
var _ = Suite(&MySuite{})


func (s *MySuite) TestCombinationForNumber2_1(c *C) {
	gen := New(2, 1)
	num := uint64(0)
	c.Assert(gen.Next(), DeepEquals, CombinationForNumber(2, 1, num))
	num++
	c.Assert(gen.Next(), DeepEquals, CombinationForNumber(2, 1, num))
	num++
}

func (s *MySuite) TestCombinationForNumber1000_999(c *C) {
	var lim uint64 = 1000
	gen := New(lim, lim - 1)
	num := uint64(0)
	for gen.HasNext() {
		c.Assert(gen.Next(), DeepEquals, CombinationForNumber(lim, lim - 1, num))
		num++
	}
	c.Assert(num, Equals, lim)
}

func (s *MySuite) TestCombinatorialNumbers(c *C) {
	for n := uint64(2); n <= 16; n++ {
		for k := uint64(1); k < n; k++ {
			gen := New(n, k)
			num := uint64(0)
			for gen.HasNext() {
				cur := gen.Current()
				fromNum := CombinationForNumber(n, k, num)
				numFromCur := CombinatorialNumber(cur)
				c.Assert(cur, DeepEquals, fromNum)
				c.Assert(num, Equals, numFromCur)

				gen.Next()
				num++
			}
			c.Assert(num, Equals, BinomialCoefficient(n, k))
		}
	}
}

