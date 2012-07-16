run:
	R --vanilla < scratch.r
	evince Rplots.pdf

edit:
	cp start.r scratch.r
	$${EDITOR:-vim} scratch.r

check:
	diff --ignore-all-space solution.r scratch.r 

clean:
	rm scratch.r Rplots.pdf
