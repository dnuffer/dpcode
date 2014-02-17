#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>

#include <vector>
#include <iterator>
#include <set>
using namespace std;



// TODO: Write find_removals() which returns a list containing the items that are in the first sequence 
// parameter and not in the second sequence parameter which preserves the order of items in the first
// sequence

BOOST_AUTO_TEST_CASE(test1)
{
	BOOST_CHECK(find_removals(vector<int>{1, 2, 3}, vector<int>{2, 3, 4}) == vector<int>{1});
	BOOST_CHECK((find_removals(vector<int>{1, 2, 3}, vector<int>{3, 4, 5}) == vector<int>{1, 2}));
	BOOST_CHECK((find_removals(vector<int>{1, 2, 3}, vector<int>{}) == vector<int>{1, 2, 3}));
	BOOST_CHECK((find_removals(vector<int>{3, 2, 1}, vector<int>{}) == vector<int>{3, 2, 1}));
	BOOST_CHECK((find_removals(vector<int>{}, vector<int>{1, 2, 3}) == vector<int>{}));
}
