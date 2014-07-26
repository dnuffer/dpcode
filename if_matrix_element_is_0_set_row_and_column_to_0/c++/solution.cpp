#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE foo
#include <boost/test/unit_test.hpp>

#include <vector>
using namespace std;

vector<vector<int>> set_0(const vector<vector<int>> m)
{
	vector<vector<int>> result(m);
	vector<vector<int>> are_zero(m);
	for (size_t i = 0; i < m.size(); i++)
	{
		for (size_t j = 0; j < m[0].size(); j++)
		{
			are_zero[i][j] = (m[i][j] == 0);
		}
	}

	for (size_t i = 0; i < m.size(); i++)
	{
		for (size_t j = 0; j < m[0].size(); j++)
		{
			if (are_zero[i][j] == 1) 
			{
				for (size_t a = 0; a < m.size(); a++)
				{
					result[a][j] = 0;
				}
				for (size_t a = 0; a < m[0].size(); a++)
				{
					result[i][a] = 0;
				}
			}
		}
	}
	return result;
}

BOOST_AUTO_TEST_CASE(test_set_0)
{
	BOOST_CHECK((set_0(vector<vector<int>> {{1, 1}, {0, 1}})) == (vector<vector<int>> {{0, 1}, {0, 0}}));
}
