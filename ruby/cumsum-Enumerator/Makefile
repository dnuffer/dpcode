run:
	ruby scratch.rb

edit:
	if ! [ -e scratch.rb ]; then cp start.rb scratch.rb; fi
	$${EDITOR:-vim} scratch.rb

check:
	ruby scratch.rb

clean:
	rm -f scratch.r
