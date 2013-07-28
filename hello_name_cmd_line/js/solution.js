#!/usr/bin/env node
var myArgs = require('optimist').argv,
    help = "--name <name>";

if ((myArgs.h) || (myArgs.help)) {
  console.log(help);
  process.exit(0);
}

var name = myArgs.name
console.log("Hello, " + name);
