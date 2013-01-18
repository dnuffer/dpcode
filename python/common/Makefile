EXT=py
run:
	. ../../../dpcode-python-env/bin/activate; python scratch.$(EXT)

edit:
	if ! [ -e scratch.$(EXT) ]; then cp start.$(EXT) scratch.$(EXT); fi
	. ../../../dpcode-python-env/bin/activate; $${EDITOR:-vim} scratch.$(EXT)

check:
	. ../../../dpcode-python-env/bin/activate; python scratch.$(EXT)

clean:
	rm -f scratch.$(EXT)
