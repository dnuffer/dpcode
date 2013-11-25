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

func (s *MySuite) TestBionmialCoefficient(c *C) {
	c.Assert(BinomialCoefficient(5, 3), Equals, uint64(10))
	c.Assert(BinomialCoefficient(5, 2), Equals, uint64(10))
	c.Assert(BinomialCoefficient(100, 2), Equals, uint64(4950))
	c.Assert(BinomialCoefficient(100, 98), Equals, uint64(4950))
	c.Assert(BinomialCoefficient(8, 5), Equals, uint64(56))
	c.Assert(BinomialCoefficient(1, 1), Equals, uint64(1))
}
