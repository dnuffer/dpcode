#include "singly_linked_list.hpp"

#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Hello
#include <boost/test/unit_test.hpp>

BOOST_AUTO_TEST_CASE(singly_linked_list_to_string_empty)
{
	BOOST_CHECK(singly_linked_list<int>().to_string() == std::string("[]"));
}

BOOST_AUTO_TEST_CASE(singly_linked_list_to_string_single)
{
	singly_linked_list<int> l;
	auto it = l.before_begin();
	it = l.insert_after(it, 1);
	BOOST_CHECK_EQUAL(l.to_string(), "[1]");
}

BOOST_AUTO_TEST_CASE(singly_linked_list_to_string_three)
{
	singly_linked_list<int> l;
	auto it = l.before_begin();
	it = l.insert_after(it, 1);
	it = l.insert_after(it, 2);
	it = l.insert_after(it, 3);
	BOOST_CHECK_EQUAL(l.to_string(), "[1 -> 2 -> 3]");
}

BOOST_AUTO_TEST_CASE(singly_linked_list_to_wstring_three)
{
	singly_linked_list<int> l;
	auto it = l.before_begin();
	it = l.insert_after(it, 1);
	it = l.insert_after(it, 2);
	it = l.insert_after(it, 3);
	BOOST_CHECK(l.to_wstring() == L"[1 -> 2 -> 3]");
}

BOOST_AUTO_TEST_CASE(singly_linked_list_to_u16string_three)
{
	singly_linked_list<int> l;
	auto it = l.before_begin();
	it = l.insert_after(it, 1);
	it = l.insert_after(it, 2);
	it = l.insert_after(it, 3);
	//BOOST_CHECK(l.to_u16string() == u"[1 -> 2 -> 3]");
}

BOOST_AUTO_TEST_CASE(singly_linked_list_takes_uniform_initialization_constructor)
{
	singly_linked_list<int> l({1, 2, 3});
	BOOST_CHECK_EQUAL(l.to_string(), "[1 -> 2 -> 3]");
}
