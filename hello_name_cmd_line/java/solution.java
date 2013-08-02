import org.apache.commons.cli.*;

public class solution {
	public static void main(String[] args) {
		Options options = new Options();
		options.addOption("n", "name", true, "set name");
		options.addOption("h", "help", false, "print help");
		CommandLineParser parser = new BasicParser();
		try {
			CommandLine cmd = parser.parse(options, args);
			if (cmd.hasOption("help"))
			{
				HelpFormatter formatter = new HelpFormatter();
				formatter.printHelp("solution", options);
				System.exit(0);
			}

			String name = cmd.getOptionValue("name");
			if (name != null) {
				System.out.println("Hello, " + name);
			} else {
				System.out.println("name not specified");
				HelpFormatter formatter = new HelpFormatter();
				formatter.printHelp("solution", options);
				System.exit(1);
			}
		} catch (ParseException ex) {
			System.out.println("Failed to parse command line\n" + ex.getMessage());
			HelpFormatter formatter = new HelpFormatter();
			formatter.printHelp("solution", options);
			System.exit(1);
		}
	}
}
