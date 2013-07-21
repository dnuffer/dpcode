#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
	NSData *inputData = [NSData dataWithData:[input readDataToEndOfFile]];
	NSString *name = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

	printf("Hello, %s\n", [name UTF8String]);
	[pool drain];
	return 0;
}
