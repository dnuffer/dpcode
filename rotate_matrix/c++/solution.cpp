#include <vector>
#include <iostream>

#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>

using namespace std;

// Write rotate_matrix() which rotates a NxM matrix clockwise by 90 degrees.

template <typename T>
vector<vector<T>> rotate_matrix(const vector<vector<T>>& m)
{
	if (m.size() == 0)
		return m;

	vector<vector<T>> result(m[0].size());
	for (size_t i = 0; i < m[0].size(); i++)
	{
		result[i].resize(m.size());
		for (size_t j = 0; j < m.size(); j++)
		{
			result[i][j] = m[m.size() - j - 1][i];
		}
	}
	return result;
}

typedef vector<vector<int>> mat;

BOOST_AUTO_TEST_CASE(rotate_matrix_empty)
{
	BOOST_CHECK(rotate_matrix(mat {}) == mat {});
}
BOOST_AUTO_TEST_CASE(rotate_matrix_one)
{
	BOOST_CHECK(rotate_matrix(mat {{1}}) == mat {{1}});
}
BOOST_AUTO_TEST_CASE(rotate_matrix_one_by_two)
{
	BOOST_CHECK(rotate_matrix(mat {{1, 2}}) == mat({{1}, {2}}));
}
BOOST_AUTO_TEST_CASE(rotate_matrix_two_by_one)
{
	BOOST_CHECK(rotate_matrix(mat {{1}, {2}}) == mat({{2, 1}}));
}
BOOST_AUTO_TEST_CASE(rotate_matrix_two_by_two)
{
	BOOST_CHECK(rotate_matrix(mat {{1, 2}, {3, 4}}) == mat({{3, 1}, {4, 2}}));
}
BOOST_AUTO_TEST_CASE(rotate_matrix_three_by_two)
{
	BOOST_CHECK(rotate_matrix(mat {{1, 2}, {3, 4}, {5, 6}}) == mat({{5, 3, 1}, {6, 4, 2}}));
}
