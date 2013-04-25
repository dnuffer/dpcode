run: check

edit:
	if ! [ -e scratch_spec.rb ]; then cp start.rb scratch_spec.rb; fi
	$${EDITOR:-vim} scratch_spec.rb

check:
	rspec scratch_spec.rb

clean:
	rm -f scratch_spec.rb
