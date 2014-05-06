run:
	R --vanilla < scratch.R
	evince Rplots.pdf

edit:
	if ! [ -e scratch.R ]; then cp start.R scratch.R; fi
	$${EDITOR:-vim} scratch.R

check:
	diff --ignore-all-space solution.R scratch.R 

check-solution:

clean:
	rm -f scratch.R Rplots.pdf
