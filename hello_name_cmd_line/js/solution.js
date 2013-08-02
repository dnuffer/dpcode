#!/usr/bin/env node
var optimist = require('optimist')
              .usage('Say Hi.\nUsage: $0')
              .options('n', {
                alias: 'name',
                default: '',
                describe: 'specify the name'
              })
              .options('h', {
                alias: 'help',
                describe: 'print the help'
              })

var myArgs = optimist.argv

if (myArgs.h) {
  console.log(optimist.help());
  process.exit(0);
}

var name = myArgs.name;

if (name == '' || name == true) {
  console.error(optimist.help());
  process.exit(1);
}

console.log("Hello, " + name);
