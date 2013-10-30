check: setup
	npm test

setup: node_modules

node_modules: package.json
	rm -rf node_modules
	npm install
