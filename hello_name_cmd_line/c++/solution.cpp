#include <iostream>
#include <string>
#include <boost/program_options.hpp>

using namespace std;
using namespace boost::program_options;

int main(int argc, char** argv)
{
	string name;

	options_description desc("Usage: solution [options]");
	desc.add_options()
		("help", "print help")
		("name,n", value<string>(&name), "set name");

	variables_map vm;
	try
	{
		store(parse_command_line(argc, argv, desc), vm);
	}
	catch (error& e)
	{
		cerr << "solution: " << e.what() << endl;
		cerr << "Try `solution --help' for more information." << endl;
		return 1;
	}
	notify(vm);

	if (vm.count("help"))
	{
		cout << desc << endl;
		return 0;
	}

	if (vm.count("name") == 0)
	{
		cerr << "solution: missing --name" << endl;
		cerr << "Try `solution --help' for more information." << endl;
		return 1;
	}

	cout << "Hello, " << name << endl;
}
