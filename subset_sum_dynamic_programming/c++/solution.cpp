#include <cassert>
#include <cstdio>
#include <vector>
#include <cstdlib>

using namespace std;

int maximum_weighted_subset(const vector<int>& weights, int bound)
{
	if (weights.size() == 0)
		return 0;

	vector<int> max_weights(bound + 1, 0);

	for (size_t i = weights[0]; i <= bound; ++i)
		max_weights[i] = weights[0];

	for (size_t n = 1; n < weights.size(); ++n)
	{
		for (size_t i = bound; (i+1) > 0; --i)
		{
			if (weights[n] <= i)
			{
				max_weights[i] = max(max_weights[i], max_weights[i - weights[n]] + weights[n]);
			}
		}
	}

	return max_weights[bound];
}

void assert_equal(int actual, int expected)
{
	if (actual != expected)
	{
		printf("actual (%d) != expected (%d)\n", actual, expected);
		exit(1);
	}
}

int main(int argc, char** argv)
{

	assert_equal(maximum_weighted_subset(vector<int>{}, 9), 0);
	assert_equal(maximum_weighted_subset(vector<int>{1, 3, 6}, 9), 9);
	assert_equal(maximum_weighted_subset(vector<int>{1, 3, 6}, 8), 7);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 7), 6);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 6), 6);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 5), 5);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 4), 4);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 3), 3);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 2), 2);
	assert_equal(maximum_weighted_subset(vector<int>{1, 2, 3}, 1), 1);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 7), 7);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 6), 6);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 5), 5);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 4), 4);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 3), 3);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 2), 2);
	assert_equal(maximum_weighted_subset(vector<int>{4, 2, 1}, 1), 1);
	assert_equal(maximum_weighted_subset(vector<int>{3, 5, 7}, 6), 5);
	printf("All tests passed!\n");
}
