using System;
using Mono.Options;

public class Hello 
{
	public static int Main(string[] args) 
	{
		bool show_help = false;
		string name = "";

		var p = new OptionSet() 
		{
			{ "n|name=", "the {NAME} of someone to greet.",
				v => name = v },
			{ "h|help",  "show this message and exit", 
				v => show_help = true },
		};

		try 
		{
			p.Parse(args);

			if (!show_help && name == "") 
			{
				throw new OptionException("missing name", "name");
			}
		} 
		catch (OptionException e) 
		{
			Console.Error.Write("scratch: ");
			Console.Error.WriteLine(e.Message);
			Console.Error.WriteLine("Try `scratch --help' for more information.");
			return 1;
		}

		if (show_help) 
		{
			Console.WriteLine("Usage: scratch [options]");
			p.WriteOptionDescriptions(Console.Out);
			return 0;
		}

		Console.WriteLine("Hello, " + name);
		return 0;
	}
}
