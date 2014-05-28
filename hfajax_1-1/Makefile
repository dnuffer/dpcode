run:

edit:
	if ! [ -e scratch ]; then cp start scratch; fi
	$${EDITOR:-vim} scratch/introduction.html

check:
	diff --ignore-all-space -N -u -r solution scratch 

check-solution:

clean:
	rm -rf scratch
