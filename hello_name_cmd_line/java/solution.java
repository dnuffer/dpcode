import org.apache.commons.cli.*;

public class solution {
	public static void main(String[] args) {
		Options options = new Options();
		options.addOption("name", true, "set name");
		CommandLineParser parser = new BasicParser();
		try {
			CommandLine cmd = parser.parse(options, args);
			String name = cmd.getOptionValue("name");
			if (name != null) {
				System.out.println("Hello, " + name);
			} else {
				System.err.println("name not specified");
				System.exit(1);
			}
		} catch (ParseException ex) {
			System.err.println("Failed to parse command line\n" + ex.getMessage());
			System.exit(1);
		}
	}
}
