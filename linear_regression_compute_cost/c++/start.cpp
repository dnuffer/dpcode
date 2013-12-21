#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MODULE Scratch
#include <boost/test/unit_test.hpp>
#include <armadillo>



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
