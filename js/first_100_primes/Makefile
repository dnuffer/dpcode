EXT=js
run:
	node scratch.$(EXT)

edit:
	if ! [ -e scratch.$(EXT) ]; then cp start.$(EXT) scratch.$(EXT); fi
	$${EDITOR:-vim} scratch.$(EXT)

check:
	node scratch.$(EXT) && \
	diff first_100_primes.txt expected_output.txt

clean:
	rm -f scratch.$(EXT)
