#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>
#include <boost/lexical_cast.hpp>
#include <string>
#include <armadillo>
#include <tuple>

using namespace arma;
using namespace std;
using namespace boost;

template <typename T>
mat sigmoid(const T& z)
{
	return 1. / (1. + exp(-z));
}

umat predict(const vec& theta, const mat& X)
{
	return sigmoid(X * theta) >= 0.5;
}

BOOST_AUTO_TEST_CASE(test1)
{
	vec theta = "-25.16154 0.20623 0.20147";
	mat X = "1.0 45.0 85.0";
	umat y = predict(theta, X);
	BOOST_CHECK_EQUAL(y(0,0), 1);
	mat X2 = "1.0 45.0 85.0; 1.0 30 30";
	umat y2 = predict(theta, X2);
	BOOST_CHECK_EQUAL(y2(0, 0), 1);
	BOOST_CHECK_EQUAL(y2(1, 0), 0);
}

