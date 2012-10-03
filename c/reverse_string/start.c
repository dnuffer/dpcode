#include <assert.h>
#include <stdio.h>

// TODO write reverse()

int main()
{
	char str[] = "hello";
	reverse(str);
	assert(strcmp(str, "olleh") == 0);
}

