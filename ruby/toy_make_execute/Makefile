run:
	bundle exec ruby scratch.rb

edit:
	if ! [ -e scratch.rb ]; then cp start.rb scratch.rb; fi
	$${EDITOR:-vim} scratch.rb

check:
	./bin/rspec *_spec.rb

clean:
	rm -f scratch.rb

ifneq ($(wildcard Gemfile),)

setup: Gemfile.lock

Gemfile.lock: Gemfile
	bundle install --binstubs
	touch Gemfile.lock

endif
