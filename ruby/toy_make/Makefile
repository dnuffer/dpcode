run:
	ruby scratch.rb

edit:
	if ! [ -e scratch.rb ]; then cp start.rb scratch.rb; fi
	$${EDITOR:-vim} scratch.rb

check:
	rspec *_spec.rb

clean:
	rm -f scratch.rb
