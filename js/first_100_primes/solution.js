#!/usr/bin/env node

function is_prime(number)
{
	for (i = 2; i <= Math.sqrt(number); i++)
	{
		if (number % i == 0)
			return false;
	}
	return true;
}

var fs = require('fs');
var outfile = 'first_100_primes.txt'

var primes = [];
var number = 2;
while (primes.length < 100)
{
	if (is_prime(number))
	{
		primes.push(number);
	}

	number++;
}

var out = primes.join(",");
fs.writeFileSync(outfile, out);
console.log("Script: " + __filename + "\nWrote: " + out + "To: " + outfile);
