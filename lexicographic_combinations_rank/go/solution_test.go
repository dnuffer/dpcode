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


func (s *MySuite) TestCombinatorialNumber2_1(c *C) {
	gen := New(2, 1)
	c.Assert(CombinatorialNumber(gen.Next()), Equals, uint64(0))
	c.Assert(CombinatorialNumber(gen.Next()), Equals, uint64(1))
}

func (s *MySuite) TestCombinatorialNumber1000_999(c *C) {
	var lim uint64 = 1000
	gen := New(lim, lim - 1)
	expectedCN := uint64(0)
	c.Assert(CombinatorialNumber(gen.Next()), Equals, expectedCN)
	expectedCN++
	for i := uint64(1); i < lim; i++ {
		c.Assert(CombinatorialNumber(gen.Next()), Equals, expectedCN)
		expectedCN++
	}
}

func (s *MySuite) TestCombinatorialNumbers(c *C) {
	for n := uint64(2); n <= 16; n++ {
		for k := uint64(1); k < n; k++ {
			gen := New(n, k)
			num := uint64(0)
			for gen.HasNext() {
				cur := gen.Current()
				numFromCur := CombinatorialNumber(cur)
				c.Assert(num, Equals, numFromCur)

				gen.Next()
				num++
			}
			c.Assert(num, Equals, BinomialCoefficient(n, k))
		}
	}
}

