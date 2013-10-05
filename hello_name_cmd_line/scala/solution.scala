import org.apache.commons.cli._;

object solution extends App {
  var options = new Options();
  options.addOption("n", "name", true, "set name");
  options.addOption("h", "help", false, "print help");
  var parser = new BasicParser();
  try {
    var cmd = parser.parse(options, args);
    if (cmd.hasOption("help")) {
      var formatter = new HelpFormatter();
      formatter.printHelp("solution [options]", options);
      System.exit(0);
    }

    var name = cmd.getOptionValue("name");
    if (name != null) {
      System.out.println("Hello, " + name);
    } else {
      System.err.println("solution: name not specified");
      System.err.println("Try `solution --help' for more information.");
      System.exit(1);
    }
  } catch {
    case ex: ParseException => {
      System.out.println("solution: Failed to parse command line\n" + ex.getMessage());
      System.err.println("Try `solution --help' for more information.");
      System.exit(1);
    }
  }
}
