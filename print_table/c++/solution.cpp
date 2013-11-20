#include <sstream>
#include <vector>
#include <string>
#include <cassert>
#include <iostream>

using namespace std;

string format_table(const vector<vector<string>>& table)
{
	stringstream res;
	auto rows = table.size();
	if (rows == 0)
		return res.str();

	auto cols = table[0].size();

	vector<int> col_widths(cols);
	for (int c = 0; c < cols; c++)
	{
		for (int r = 0; r < rows; r++)
		{
			col_widths[c] = table[r][c].size() > col_widths[c] ? table[r][c].size() : col_widths[c];
		}
	}
	for (int r = 0; r < rows; r++)
	{
		for (int c = 0; c < cols; c++)
		{
			res << table[r][c];
			for (int x = 0; x < col_widths[c] - table[r][c].size(); x++)
				res << ' ';
		}
		res << '\n';
	}
	return res.str();
}

int main(int argc, char** argv)
{
	assert(format_table({}) == "");
	assert(format_table({{"x"}}) == "x\n");
	assert(format_table({{"1"}, {"2"}}) == "1\n2\n");
	assert(format_table({{"12", "34"}, {"5", "6"}}) == "1234\n5 6 \n");
	assert(format_table({{"12", "34", "X"}, {"5", "678", "Y"}, {"901", "2", "ZA"}}) == "12 34 X \n5  678Y \n9012  ZA\n");
	cout << "All tests successful!\n";
}

