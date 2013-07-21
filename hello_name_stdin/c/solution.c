#include <stdio.h>

int main(int argc, char** argv)
{
	char name[1024];
	fgets(name, sizeof(name), stdin);
	size_t len = strlen(name);
	if (len > 0 && name[len-1] == '\n')
	{
		name[len-1] = '\0';
	}
	printf("Hello, %s\n", name);
	return 0;
}
