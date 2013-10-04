#!/usr/bin/env node

function is_prime(number) {
	for (i = 2; i <= Math.sqrt(number); i++) {
		if (number % i == 0) {
			return false;
    }
	}
	return true;
}

var primes = [];
var number = 2;
while (primes.length < 100) {
	if (is_prime(number)) {
		primes.push(number);
	}

	number++;
}

var out = primes.join(",");
console.log(out);
