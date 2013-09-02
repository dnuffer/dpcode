#import <Foundation/Foundation.h>

void print_usage(FILE* out)
{
	fprintf(out, "Usage: solution [options]\n");
	fprintf(out, " -h, --help        print help\n");
	fprintf(out, " -n, --name <arg>  set name\n");
}

int main(int argc, const char * argv[])
{
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];

	if (argc == 2 && strcmp(argv[1], "--help") == 0)
	{
		print_usage(stdout);
		return 0;
	}

	if (argc != 3 || (strcmp(argv[1], "--name") != 0 && strcmp(argv[1], "-n") != 0))
	{
		fprintf(stderr, "solution: Invalid command line\n");
		fprintf(stderr, "Try `solution --help' for more information.\n");
		return 1;
	}

	printf("Hello, %s\n", argv[2]);
	[pool drain];
	return 0;
}
