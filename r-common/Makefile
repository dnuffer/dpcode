run:
	R --vanilla < scratch.r
	evince Rplots.pdf

edit:
	if ! [ -e scratch.r ]; then cp start.r scratch.r; fi
	$${EDITOR:-vim} scratch.r

check:
	diff --ignore-all-space solution.r scratch.r 

clean:
	rm scratch.r Rplots.pdf
