#include <assert.h>
#include <stdio.h>
#include <string.h>

void reverse(char* s)
{
	size_t len = strlen(s);
	for (size_t i = 0; i < len / 2; ++i)
	{
		char tmp = s[i];
		s[i] = s[len - i - 1];
		s[len - i - 1] = tmp;
	}
}

int main()
{
	char str[] = "hello";
	reverse(str);
	assert(strcmp(str, "olleh") == 0);
}

