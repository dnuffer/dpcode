library(testthat)

compute_cost = function(X, y, theta) {
  tmp1 = X %*% theta - y
  J = 0.5 / nrow(y) * t(tmp1) %*% tmp1
  return(J[1,1])
}

test_that("compute_cost works", {
          X = matrix(c(10,20,300,400), nrow=2, ncol=2, byrow=TRUE)
          y = matrix(c(5,50), nrow=2, ncol=1)
          theta = matrix(c(5,2), nrow=2, ncol=1)
          expect_that(compute_cost(X, y, theta), equals(1267431.25))
})
