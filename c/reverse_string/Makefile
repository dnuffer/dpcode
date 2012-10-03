EXT=c

run: scratch
	./scratch

scratch: scratch.$(EXT)
	g++ -o scratch scratch.$(EXT)

edit:
	if ! [ -e scratch.$(EXT) ]; then echo > scratch.$(EXT); fi
	$${EDITOR:-vim} scratch.$(EXT)

check: scratch
	./scratch

clean:
	rm -f scratch scratch.$(EXT)
