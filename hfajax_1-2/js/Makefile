run:

edit:
	if ! [ -e scratch ]; then cp -r start scratch; fi
	$${EDITOR:-vim} scratch/scripts/thumbnails.js

check:
	diff --ignore-all-space -N -u -r solution scratch 

check-solution:

clean:
	rm -rf scratch
