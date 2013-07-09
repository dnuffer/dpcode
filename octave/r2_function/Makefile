run:
	octave -q --eval "test FunctionRSquared" | egrep "PASSES ([0-9]+) out of \1 tests"
	octave -q --eval "test Variance" | egrep "PASSES ([0-9]+) out of \1 tests"

edit:
	if ! [ -e FunctionRSquared.m ]; then cp FunctionRSquared_start.m FunctionRSquared.m; fi
	if ! [ -e Variance.m ]; then cp Variance_start.m Variance.m; fi
	$${EDITOR:-vim} Variance.m FunctionRSquared.m

check: run

clean:
	rm -f FunctionRSquared.m Variance.m
