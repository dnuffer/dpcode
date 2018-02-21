#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE solution
#include <boost/test/unit_test.hpp>

using namespace std;

// TODO: write maximum_weighted_subset
// Input:
//    weights: A list of non-negative integral weights.
//    W: A non-negative integral weight bound.
// Output:
//    The maximum weight of any valid subset of weights.
//    A valid subset is one with total weight at most W.

int maximum_weighted_subset(const vector<int>& weights, int bound)
{
}

BOOST_AUTO_TEST_CASE(test_maximum_weighted_subset)
{
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{}, 9), 0);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 3, 6}, 9), 9);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 3, 6}, 8), 7);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 7), 6);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 6), 6);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 5), 5);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 4), 4);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 3), 3);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 2), 2);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{1, 2, 3}, 1), 1);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 7), 7);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 6), 6);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 5), 5);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 4), 4);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 3), 3);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 2), 2);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{4, 2, 1}, 1), 1);
	BOOST_CHECK_EQUAL(maximum_weighted_subset(vector<int>{3, 5, 7}, 6), 5);
}

