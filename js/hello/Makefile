EXT=js
run:
	node scratch.$(EXT)

edit:
	if ! [ -e scratch.$(EXT) ]; then cp start.$(EXT) scratch.$(EXT); fi
	$${EDITOR:-vim} scratch.$(EXT)

check:
	node scratch.$(EXT) && \
	echo "Hello, world" | diff - hello.txt

clean:
	rm -f scratch.$(EXT)
