
readline = require('readline')
moment = require('moment-timezone')

rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout
})

rl.question("What is your birthday? ", (answer) ->
	birthday = answer.trim()
	rl.question("What Time Zone were you born in? ", (answer) ->
		time_zone = answer.trim()

		birth_time = moment(birthday).tz(time_zone)

		comparison_time = moment.unix(1380633042).tz("America/Denver")
		console.log("On " + comparison_time.format("YYYY-MM-DDTHH:mm:ssZ") + " you were " + 
			(comparison_time.unix() - birth_time.unix()) + " seconds old");

		rl.close()
	)
)

