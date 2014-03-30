#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>
#include <vector>
#include <iostream>
#include <cmath>
using namespace std;

namespace std {
ostream& operator<<(ostream& ostr, const vector<int>& v)
{
	ostr << "[";
	for (int i:v)
	{
		ostr << i << ", ";
	}
	ostr << "]";
	return ostr;
}
}

vector<int> mapFeature(int x1, int x2, int n)
{
	vector<int> out = {1};

	for (int i = 1; i <= n; i++)
	{
		for (int j = 0; j <= i; j++)
		{
			out.push_back(pow(x1, i-j) * pow(x2, j));
		}
	}
	return out;
}

BOOST_AUTO_TEST_CASE(mapFeature0)
{
	BOOST_CHECK_EQUAL(mapFeature(2, 4, 0), vector<int>{1});
}

BOOST_AUTO_TEST_CASE(mapFeature1)
{
	BOOST_CHECK_EQUAL(mapFeature(2, 4, 1), (vector<int>{1, 2, 4}));
}

BOOST_AUTO_TEST_CASE(mapFeature2)
{
	BOOST_CHECK_EQUAL(mapFeature(2, 4, 2), (vector<int>{1, 2, 4, 4, 8, 16}));
}
