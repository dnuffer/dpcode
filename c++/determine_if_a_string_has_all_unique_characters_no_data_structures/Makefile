run: scratch
	./scratch

scratch: scratch.cpp
	g++ -o scratch scratch.cpp

edit:
	if ! [ -e scratch.cpp ]; then echo > scratch.cpp; fi
	$${EDITOR:-vim} scratch.cpp

check: scratch
	./scratch

clean:
	rm -f scratch scratch.cpp
