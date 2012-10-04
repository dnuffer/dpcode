EXT=py
run:
	python scratch.$(EXT)

edit:
	if ! [ -e scratch.$(EXT) ]; then cp start.$(EXT) scratch.$(EXT); fi
	$${EDITOR:-vim} scratch.$(EXT)

check:
	python scratch.$(EXT)

clean:
	rm -f scratch.$(EXT)
