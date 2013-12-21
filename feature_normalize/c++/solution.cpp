#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE scratch
#include <boost/test/unit_test.hpp>
#include <armadillo>
#include <tuple>
#include <boost/lexical_cast.hpp>
#include <string>

using namespace arma;
using namespace std;
using namespace boost;

tuple<mat, mat, mat> feature_normalize(const mat& X)
{
	mat mu = mean(X);
	mat sigma = stddev(X);
	mat X_norm = (X - ones<mat>(X.n_rows, 1) * mu) / (ones<mat>(X.n_rows, 1) * sigma);
	return make_tuple(X_norm, mu, sigma);
}

string to_s(const mat& m) { return lexical_cast<string>(m); }

BOOST_AUTO_TEST_CASE(feature_normalize_test)
{
	mat X_norm, mu, sigma;
	mat X = "1 3; 2 4; 3 5";
	tie(X_norm, mu, sigma) = feature_normalize(X);
	BOOST_CHECK_EQUAL(to_s(X_norm), to_s(mat("-1 -1; 0 0; 1 1")));
	BOOST_CHECK_EQUAL(to_s(mu), to_s(mat("2 4")));
	BOOST_CHECK_EQUAL(to_s(sigma), to_s(mat("1 1")));
}
