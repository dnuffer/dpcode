#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>


BOOST_AUTO_TEST_CASE(test_nested_parens)
{
	BOOST_CHECK_EQUAL(nested_parens("a"), true);
	BOOST_CHECK_EQUAL(nested_parens("("), false);
	BOOST_CHECK_EQUAL(nested_parens(")("), false);
	BOOST_CHECK_EQUAL(nested_parens("(abc)"), true);
	BOOST_CHECK_EQUAL(nested_parens("(abc)def"), true);
}

