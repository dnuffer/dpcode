#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <stdbool.h>

int main(int argc, char** argv)
{
	bool show_help = false;
	char* name = NULL;

	while (true)
	{

		int this_option_optind = optind ? optind : 1;
		int option_index = 0;
		static struct option long_options[] = {
			{"name",    required_argument, 0, 'n'},
			{"help",    no_argument,       0, 'h'},
			{0,         0,                 0,  0 }
		};

		int c = getopt_long(argc, argv, "n:h", long_options, &option_index);

		if (c == -1)
				break;

		switch (c) {
		case 'n':
			name = optarg;
			break;

		case 'h':
			show_help = true;
			break;
		}
	}

	if (name == NULL && !show_help)
	{
		fprintf(stderr, "scratch: missing name\n");
		fprintf(stderr, "Try `scratch --help' for more information.\n");
		exit(EXIT_FAILURE);
	}

	if (show_help)
	{
		printf("Usage: scratch [options]\n");
		printf("  -n, --name=NAME            the NAME of someone to greet.\n");
		printf("  -h, --help                 show this message and exit\n");
		exit(EXIT_SUCCESS);
	}

	printf("Hello, %s\n", name);
	exit(EXIT_SUCCESS);
}
