#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE foo
#include <boost/test/unit_test.hpp>

#include <vector>
using namespace std;


BOOST_AUTO_TEST_CASE(test_set_0)
{
	BOOST_CHECK((set_0(vector<vector<int>> {{1, 1}, {0, 1}})) == (vector<vector<int>> {{0, 1}, {0, 0}}));
}
