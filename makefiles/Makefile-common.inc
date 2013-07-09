run:
	@if [ -x ./run ]; then ./run; else ./scratch.$(EXT); fi

check:
	@if [ -x ./check ]; then ./check; else ./scratch.$(EXT); fi

edit:
	@if ! [ -e scratch.$(EXT) ]; then cp start.$(EXT) scratch.$(EXT); fi
	@$${EDITOR:-vim} scratch.$(EXT)

clean:
	@rm -f scratch.$(EXT)

.PHONY: check run edit clean
