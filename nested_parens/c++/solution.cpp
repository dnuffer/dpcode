#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>

bool nested_parens(const char* s)
{
	int depth = 0;
	const char* cur = s;
	while (*cur != '\0')
	{
		char c = *cur;
		if (c == ')')
		{
			--depth;
			if (depth < 0)
			{
				return false;
			}
		} 
		else if (c == '(')
		{
			++depth;
		}
		++cur;
	}
	return depth == 0;
}

BOOST_AUTO_TEST_CASE(test_nested_parens)
{
	BOOST_CHECK_EQUAL(nested_parens("a"), true);
	BOOST_CHECK_EQUAL(nested_parens("("), false);
	BOOST_CHECK_EQUAL(nested_parens(")("), false);
	BOOST_CHECK_EQUAL(nested_parens("(abc)"), true);
	BOOST_CHECK_EQUAL(nested_parens("(abc)def"), true);
}

