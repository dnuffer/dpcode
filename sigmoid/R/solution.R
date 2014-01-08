sigmoid = function(z) {
  return(1/(1+exp(-z)))
}

library(testthat)

test_that("sigmoid works", {
          expect_that(sigmoid(0), equals(0.5))
          expect_that(sigmoid(1), equals(0.73106, tol=1e-5))
          expect_that(sigmoid(-1), equals(0.26894, tol=1e-5))
          expect_that(sigmoid(c(1, 10, 100)), equals(c(0.73106, 0.99995, 1.0), tol=1e-5))
          expect_that(sigmoid(matrix(c(1, 10, 100), nrow=3, ncol=1)), 
                              equals(matrix(c(0.73106, 0.99995, 1.0), nrow=3, ncol=1), tol=1e-5))
          expect_that(sigmoid(matrix(c(1, 2, 3, 4), nrow=2, ncol=2, byrow=TRUE)), 
                              equals(matrix(c( 0.73106, 0.88080,  0.95257, 0.98201 ), nrow=2, ncol=2, byrow=TRUE), tol=1e-5))
});

