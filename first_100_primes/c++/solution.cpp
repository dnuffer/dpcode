#include <iostream>
#include <vector>
using namespace std;

int main(int argc, char** argv)
{
	vector<bool> primes(1000, true);
	primes[0] = false;
	primes[1] = false;
	for (int i = 2; i < 100; i++)
	{
		for (int j = i * 2; j < 1000; j += i)
		{
			primes[j] = false;
		}
	}
	cout << 2;
	int curPrime = 3;
	for (int i = 1; i < 100; i++)
	{
		while (!primes[curPrime])
			curPrime++;

		cout << ',' << curPrime;
		curPrime++;
	}
}
