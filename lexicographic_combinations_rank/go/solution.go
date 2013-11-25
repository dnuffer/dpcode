// Implementation of the algorithm from The Art of Computer Programming 4A 7.2.1.3T (Lexicographic combinations)
// Generate all t combinations c_t ... c_2 c_1 of the n numbers {0, 1, ..., n - 1}, given n > t >= 0.
package solution

type CombinationsGenerator struct {
	c []uint64
	n uint64
	t uint64
	j uint64
	x uint64
	done bool
}

func New(n, t uint64) (result *CombinationsGenerator) {
	if t >= n {
		panic("t >= n")
	} else if t == 0 {
		panic("t == 0")
	}

	result = &CombinationsGenerator{ c: make([]uint64, t+2), n: n, t: t }
	// step T1. [Initialize] Set c_j <- j - 1 for 1 <= j <= t; then set c_t+1 <- n, c_t+2 <- 0, and j <- t
	for j := uint64(0); j < t; j++ {
		result.c[j] = j
	}
	result.c[t] = n
	result.c[t + 1] = 0
	result.j = t
	return result
}

func (g *CombinationsGenerator) HasNext() bool {
	return !g.done
}

func (g *CombinationsGenerator) Current() (result []uint64) {
	return g.c[0:g.t]
}

func (g *CombinationsGenerator) Next() (result []uint64) {
	// step T2p1 [Visit.] (At this point j is the smallest index such that c_j+1 > j.) Visit the combination c_t ... c_2 c_1.
	// have to make a copy because the following processing changes the underlying array
	result = make([]uint64, g.t)
	copy(result, g.c[0:g.t])

	// step T2p2 Then, if j > 0, set x <- j and go to step T6
	if g.j > 0 {
		g.x = g.j
	} else {
		// step T3 [Easy case?] If c_1 + 1 < c_2, set c_1 <- c_1 + 1 and return to T2. Otherwise set j <- 2.
		if g.c[0] + 1 < g.c[1] {
			g.c[0]++
			return
		} else {
			g.j = 2
		}
		
		// step T4 [Find j.] Set c_j-1 <- j - 2 and x <- c_j + 1. If x == c_j+1, set j <- j + 1 and repeat step T4
		for {
			g.c[g.j-2] = g.j - 2
			g.x = g.c[g.j - 1] + 1
			if g.x == g.c[g.j] {
				g.j++
			} else {
				break
			}
		}
	
		// step T5 [Done?] Terminate the algorithm if j > t.
		if g.j > g.t {
			g.done = true
		}
	}
	
	// step T6 [Increase c_j.] Set c_j <- x, j <- j - 1, and return to T2.
	g.c[g.j - 1] = g.x
	g.j--

	return
}

func BinomialCoefficient(n, k uint64) uint64 {
	if k < 0 || k > n {
		return 0
	}
	if k > (n - k) {
		k = n - k
	}
	bc := uint64(1)
	for i := uint64(1); i <= k; i++ {
		bc = (bc * (n - k + i)) / i
	}
	return bc
}

func CombinatorialNumber(c []uint64) uint64 {
	sum := uint64(0)
	for i := 0; i < len(c); i++ {
		sum += BinomialCoefficient(c[i], uint64(i) + 1)
	}
	return sum
}

