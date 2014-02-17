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
string to_s(const T& x)
{
	return lexical_cast<string>(x);
}

template <typename T>
mat sigmoid(const T& z)
{
	return 1. / (1. + exp(-z));
}

tuple<double, vec> cost_function(const vec& theta, const mat& X, const vec& y, double lambda)
{
	auto m = y.n_elem;
	vec thetaReg = theta;
	thetaReg(0) = 0.0;
	mat cost = (-1. / m) * (log(sigmoid(X * theta)).t() * y + log(1. - sigmoid(X * theta)).t() * (1. - y)) +
		lambda / (2.0 * m) * dot(thetaReg, thetaReg);
	vec grad = (1. / m) * X.t() * ( sigmoid(X * theta) - y ) + lambda / m * thetaReg;
	return make_tuple(cost(0,0), grad);
}

BOOST_AUTO_TEST_CASE(test1)
{
	vec theta = "0 0 0";
	mat X = "1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086";
	vec y = "0 0 0 1";
	double J;
	vec grad;
	tie(J, grad) = cost_function(theta, X, y, 0.0);
	BOOST_CHECK_CLOSE(J, 0.69315, 1e-3);
	BOOST_CHECK_EQUAL(to_s(grad), "    0.2500\n    5.0719\n   13.5642\n");

}

BOOST_AUTO_TEST_CASE(test2)
{
	vec theta = "-0.1 -0.1 -0.1";
	mat X = "1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086";
	vec y = "0 0 0 1";
	double J;
	vec grad;
	tie(J, grad) = cost_function(theta, X, y, 0.0);
	BOOST_CHECK_CLOSE(J, 3.6874, 1e-3);
	BOOST_CHECK_EQUAL(to_s(grad), "   -0.2499\n  -15.0413\n  -21.5706\n");
}

BOOST_AUTO_TEST_CASE(test3)
{
	vec theta = "-0.1 -0.1 -0.1";
	mat X = "1.0000 34.6237 78.0247; 1.0000 30.2867 43.8950; 1.0000 35.8474 72.9022; 1.0000   60.1826   86.3086";
	vec y = "0 0 0 1";
	double J;
	vec grad;
	tie(J, grad) = cost_function(theta, X, y, 1.0);
	BOOST_CHECK_CLOSE(J, 3.6899, 1e-3);
	BOOST_CHECK_EQUAL(to_s(grad), "   -0.2499\n  -15.0663\n  -21.5956\n");
}
