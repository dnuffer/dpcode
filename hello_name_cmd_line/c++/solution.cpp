#include <iostream>
#include <string>
#include <boost/program_options.hpp>

using namespace std;
using namespace boost::program_options;

int main(int argc, char** argv)
{
	string name;

	options_description desc("Allowed options");
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
		cerr << e.what() << endl;
		cerr << desc << endl;
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
		cerr << "missing --name" << endl;
		cerr << desc << endl;
		return 1;
	}

	cout << "Hello, " << name << endl;
}
