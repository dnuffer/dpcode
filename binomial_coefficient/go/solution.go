package solution


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

