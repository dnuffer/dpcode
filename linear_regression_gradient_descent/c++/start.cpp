#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>
#include <boost/lexical_cast.hpp>
using namespace boost;

#include <armadillo>
using namespace arma;

#include <utility>
using namespace std;

double compute_cost(const mat& X, const vec& Y, const vec& theta)
{
	auto m = Y.n_rows;

	auto XtY = X * theta - Y;
	mat J = (1.0 / (2.0 * m)) * (XtY.t() * XtY);
	//cout << "J :\n" << J << endl;
	return J(0, 0);
}

string to_s(const mat& m) { return lexical_cast<string>(m); }

struct GradDescRes
{
	vec theta;
	vec J_history;
};

GradDescRes grad_desc(const mat& X, const vec& y, const vec& theta, double alpha, int num_iters)
{
	// TODO
}

BOOST_AUTO_TEST_CASE(test1)
{
	mat X = "1 2; 3 4";
	vec y = "5 6";
	vec theta = "7 8";
	double alpha = 0.1;
	int num_iters = 10;
	auto grad_res = grad_desc(X, y, theta, alpha, num_iters);
	BOOST_CHECK_EQUAL(to_s(grad_res.J_history), to_s(mat("155.3113; 38.990; 10.6669; 3.7589; 2.0623; 1.6341; 1.5148; 1.4709; 1.4455; 1.4248")));
}
