#include "../../c++/singly_linked_list_complete/singly_linked_list.hpp"

#include <cassert>
#include <stdexcept>

int get_index(const singly_linked_list<int>& l, size_t idx)
{
	auto iter = l.cbegin();
	while (iter != l.cend() && idx > 0)
	{
		++iter;
		--idx;
	}
	if (idx != 0)
	{
		throw std::out_of_range("idx out of range");
	}
	return *iter;
}

int main(int argc, char** argv)
{
	auto l1 = singly_linked_list<int> { 0 };
	assert(get_index(l1, 0) == 0);
	auto l2 = singly_linked_list<int> { 1 };
	assert(get_index(l2, 0) == 1);
	auto l3 = singly_linked_list<int> { 0, 1, 2, 3 };
	assert(get_index(l3, 3) == 3);
	try
	{
		auto l4 = singly_linked_list<int> { 0, 1 };
		get_index(l4, 4);
		assert(false);
	}
	catch (const std::out_of_range& e)
	{
	}
}
