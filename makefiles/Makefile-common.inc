run: scratch$(BIN_EXT)
	@if [ -x ./run ]; then ./run scratch$(BIN_EXT); else $(RUN_CMD) ./scratch$(BIN_EXT); fi

check: scratch$(BIN_EXT)
	@if [ -x ./check ]; then ./check scratch$(BIN_EXT); else $(RUN_CMD) ./scratch$(BIN_EXT); fi

check-solution: solution$(BIN_EXT)
	@if [ -x ./check-solution ]; then ./check-solution; else $(RUN_CMD) ./solution$(BIN_EXT); fi

edit: scratch$(SRC_EXT)
	@$${EDITOR:-vim} scratch$(SRC_EXT)

scratch$(SRC_EXT):
	@if ! [ -e scratch$(SRC_EXT) ]; then cp start$(SRC_EXT) scratch$(SRC_EXT); fi

clean:
	rm -f scratch$(BIN_EXT) scratch$(SRC_EXT) $(SOLUTION_CLEAN)

ifneq ($(BIN_EXT), $(SRC_EXT))

scratch$(BIN_EXT): scratch$(SRC_EXT)

solution$(BIN_EXT): solution$(SRC_EXT)

SOLUTION_CLEAN=solution$(BIN_EXT)

endif

.PHONY: run check check-solution edit clean 
