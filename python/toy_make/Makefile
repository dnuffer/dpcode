run:
	python scratch.py

edit:
	if ! [ -e scratch.py ]; then cp start.py scratch.py; fi
	$${EDITOR:-vim} scratch.py

check:
	echo "FIXME"; #rspec *_spec.py

clean:
	rm -f scratch.py
