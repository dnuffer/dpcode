#include <cassert>
#include <iostream>

// write string_has_unique_chars such that it doesn't use any memory



int main(int argc, char** argv)
{
	assert(string_has_unique_chars("") == true);
	assert(string_has_unique_chars("abc") == true);
	assert(string_has_unique_chars("aaa") == false);
	std::cout << "All tests passed!\n";
}

