run: scratch
	./scratch

scratch: scratch.c
	gcc -o scratch scratch.c

edit:
	if ! [ -e scratch.c ]; then echo > scratch.c; fi
	$${EDITOR:-vim} scratch.c

check: scratch
	./scratch | diff --ignore-space - solution.c
	./scratch | diff --ignore-space - scratch.c

clean:
	rm -f scratch scratch.c
