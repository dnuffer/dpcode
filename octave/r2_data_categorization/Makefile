run:
	octave -q --eval "test CategoryRSquared" | egrep "PASSES ([0-9]+) out of \1 tests"
	octave -q --eval "test Variance" | egrep "PASSES ([0-9]+) out of \1 tests"

edit:
	if ! [ -e CategoryRSquared.m ]; then cp CategoryRSquared_start.m CategoryRSquared.m; fi
	if ! [ -e Variance.m ]; then cp Variance_start.m Variance.m; fi
	$${EDITOR:-vim} Variance.m CategoryRSquared.m

check: run

clean:
	rm -f CategoryRSquared.m Variance.m
