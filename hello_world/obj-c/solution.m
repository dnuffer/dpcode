@interface Hello:NSObject
- (void) say;
@end

@implementation Hello
- (void) say {
   NSLog(@"Hello, world");
}
@end
 
int main(int argc, char *argv[])
{
    @autoreleasepool {;
        [[Hello new] say];
    }
    return 0;
}
