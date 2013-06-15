run: scratch
	./scratch

scratch: scratch.cpp
	g++ -g -o scratch scratch.cpp

edit:
	if ! [ -e scratch.cpp ]; then cp start.cpp scratch.cpp; fi
	$${EDITOR:-vim} scratch.cpp

check: scratch
	./scratch

clean:
	rm -f scratch scratch.cpp
