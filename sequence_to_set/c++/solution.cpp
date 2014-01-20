#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>

#include <set>
#include <iterator>
#include <vector>
#include <array>

template <typename C>
auto make_set(const C& seq) -> std::set<typename std::iterator_traits<decltype(std::begin(seq))>::value_type>
{
	typedef typename std::iterator_traits<decltype(std::begin(seq))>::value_type value_type;
	return std::set<value_type>(std::begin(seq), std::end(seq));
}

BOOST_AUTO_TEST_CASE(test_create_set_from_vector)
{
	auto test_set = make_set(std::vector<int>{1,2,3});
	BOOST_CHECK_EQUAL(test_set.size(), 3);
	BOOST_CHECK_EQUAL(test_set.count(1), 1);
	BOOST_CHECK_EQUAL(test_set.count(2), 1);
	BOOST_CHECK_EQUAL(test_set.count(3), 1);
}

BOOST_AUTO_TEST_CASE(test_create_set_from_int_array)
{
	int ints[] = {1,2,3};
	auto test_set = make_set(ints);
	BOOST_CHECK_EQUAL(test_set.size(), 3);
	BOOST_CHECK_EQUAL(test_set.count(1), 1);
	BOOST_CHECK_EQUAL(test_set.count(2), 1);
	BOOST_CHECK_EQUAL(test_set.count(3), 1);
}

BOOST_AUTO_TEST_CASE(test_create_set_from_std_array)
{
	std::array<int, 3> ints = {1,2,3};
	auto test_set = make_set(ints);
	BOOST_CHECK_EQUAL(test_set.size(), 3);
	BOOST_CHECK_EQUAL(test_set.count(1), 1);
	BOOST_CHECK_EQUAL(test_set.count(2), 1);
	BOOST_CHECK_EQUAL(test_set.count(3), 1);
}
