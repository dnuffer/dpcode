run:
	echo "test CategoryRSquared" | octave -q
	echo "test Variance" | octave -q

edit:
	if ! [ -e CategoryRSquared.m ]; then cp CategoryRSquared_start.m CategoryRSquared.m; fi
	if ! [ -e Variance.m ]; then cp Variance_start.m Variance.m; fi
	$${EDITOR:-vim} Variance.m CategoryRSquared.m

check: run

clean:
	rm -f CategoryRSquared.m Variance.m
