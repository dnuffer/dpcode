run: scratch.go
	go run scratch.go

edit:
	if ! [ -e scratch.go ]; then cp start.go scratch.go; fi
	$${EDITOR:-vim} scratch.go

check: run

clean:
	rm -f scratch.go
