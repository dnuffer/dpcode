function factors = factorPrimes(x)
factors=[];

i = 2;
while i <= sqrt(x)
  if mod(x, i) == 0
    factors = [factors i];
    x = x / i;
  else
    i += 1;
  endif
endwhile
factors = [factors x];

endfunction

disp(factorPrimes(2))
disp(factorPrimes(3))
disp(factorPrimes(6))
disp(factorPrimes(15))
disp(factorPrimes(16))
disp(factorPrimes(48))
