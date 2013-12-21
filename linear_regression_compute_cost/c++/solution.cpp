#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>
#include <armadillo>
//#include <iostream>

using namespace arma;

double compute_cost(const mat& X, const vec& Y, const vec& theta)
{
	auto m = Y.n_rows;

	auto XtY = X * theta - Y;
	mat J = (1.0 / (2.0 * m)) * (XtY.t() * XtY);
	//cout << "J :\n" << J << endl;
	return J(0, 0);
}


BOOST_AUTO_TEST_CASE(test1)
{
	mat X = "10 20; 300 400";
	vec Y = "5 50";
	vec theta = "5 2";
	//cout << "X :\n" << X << endl;
	//cout << "Y :\n" << Y << endl;
	//cout << "theta :\n" << theta << endl;
	BOOST_CHECK_EQUAL(compute_cost(X, Y, theta), 1267431.25);
}
