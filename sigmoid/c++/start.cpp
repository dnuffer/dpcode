#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(sigmoid_0)
{
	BOOST_CHECK_EQUAL(sigmoid(0.), 0.5);
	BOOST_CHECK_CLOSE(sigmoid(1.), 0.73106, 1e-3);
	BOOST_CHECK_CLOSE(sigmoid(-1.), 0.26894, 1e-3);
}
