#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	if (argc != 3 || strcmp(argv[1], "--name") != 0)
	{
		fprintf(stderr, "Invalid command line\n");
		return 1;
	}

	printf("Hello, %s\n", argv[2]);
	[pool drain];
	return 0;
}
