run:
	echo "test FunctionRSquared" | octave -q
	echo "test Variance" | octave -q

edit:
	if ! [ -e FunctionRSquared.m ]; then cp FunctionRSquared_start.m FunctionRSquared.m; fi
	if ! [ -e Variance.m ]; then cp Variance_start.m Variance.m; fi
	$${EDITOR:-vim} Variance.m FunctionRSquared.m

check: run

clean:
	rm -f FunctionRSquared.m Variance.m
