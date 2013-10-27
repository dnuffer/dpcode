run:
	diff --ignore-all-space solution.template scratch.template 

edit:
	if ! [ -e scratch.template ]; then cp start.template scratch.template; fi
	$${EDITOR:-vim} scratch.template

check:
	diff --ignore-all-space solution.template scratch.template 

check-solution:

clean:
	rm -f scratch.template
