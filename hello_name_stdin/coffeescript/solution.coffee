readline = require('readline')

rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

rl.question("", (answer) ->
  console.log("Hello, " + answer)
  rl.close()
)
