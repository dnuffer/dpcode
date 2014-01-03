library(testthat)


test_that("compute_cost works", {
          X = matrix(c(10,20,300,400), nrow=2, ncol=2, byrow=TRUE)
          Y = matrix(c(5,50), nrow=2, ncol=1)
          theta = matrix(c(5,2), nrow=2, ncol=1)
          expect_that(compute_cost(X, Y, theta), equals(1267431.25))
})
