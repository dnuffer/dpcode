#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>

int pascal(int x, int y)
{
	if (x == 0 || x == y)
		return 1;
	return pascal(x, y-1) + pascal(x-1, y-2);
}

BOOST_AUTO_TEST_CASE(p0_0)
{
	BOOST_CHECK_EQUAL(pascal(0,0), 1);
}

BOOST_AUTO_TEST_CASE(p1_1)
{
	BOOST_CHECK_EQUAL(pascal(1,1), 1);
}

BOOST_AUTO_TEST_CASE(p1_2)
{
	BOOST_CHECK_EQUAL(pascal(1,2), 2);
}

BOOST_AUTO_TEST_CASE(p1_3)
{
	BOOST_CHECK_EQUAL(pascal(1,3), 3);
}
