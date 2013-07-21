#!/usr/bin/env node
var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question("", function(answer) {
  console.log("Hello, " + answer);

  rl.close();
});
