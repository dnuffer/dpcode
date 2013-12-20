#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>
#include <armadillo>
#include <iostream>

using namespace arma;
using namespace std;

double compute_cost(const mat& X, const mat& Y, const mat& theta)
{
	auto m = Y.n_rows; // number of training examples

	mat J = (1.0 / (2.0 * m)) * ((X * theta - Y).t() * (X * theta - Y));
	//cout << "J :\n" << J << endl;
	return J(0,0);
}

BOOST_AUTO_TEST_CASE(test1)
{
	mat X = "10 20; 300 400";
	mat Y = "5; 50";
	mat theta = "5; 2";
	//cout << "X :\n" << X << endl;
	//cout << "Y :\n" << Y << endl;
	//cout << "theat :\n" << theta << endl;
	BOOST_CHECK_EQUAL(compute_cost(X, Y, theta), 1267431.25);
}
