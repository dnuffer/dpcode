#!/usr/bin/env node

var outfile = 'first_100_primes.txt'

// TODO: write the first 100 primes to outfile, comma separated

fs.writeFileSync(outfile, out);
console.log("Script: " + __filename + "\nWrote: " + out + "To: " + outfile);

