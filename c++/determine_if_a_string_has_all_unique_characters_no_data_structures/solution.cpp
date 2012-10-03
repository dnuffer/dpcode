#include <cassert>
#include <iostream>

bool string_has_unique_chars(const char* s)
{
	if (*s == '\0') return true;
	for (const char* s1 = s; *s1 != '\0'; s1++)
	{
		for (const char* s2 = s1 + 1; *s2 != '\0'; s2++)
		{
			if (*s1 == *s2)
				return false;
		}
	}
	return true;
}

int main(int argc, char** argv)
{
	assert(string_has_unique_chars("") == true);
	assert(string_has_unique_chars("abc") == true);
	assert(string_has_unique_chars("aaa") == false);
	std::cout << "All tests passed!\n";
}

