computeCost = function(X, y, theta) {
  tmp1 = X %*% theta - y
  J = 0.5 / nrow(y) * t(tmp1) %*% tmp1
  return(J[1,1])
}


gradientDescent = function(X, y, theta, alpha, num_iters) {
  thetaRes = theta
  J_history = c()
  m = nrow(y)

  for (i in 1:num_iters) {
    thetaRes = thetaRes - (alpha / m) * t(X) %*% (X %*% thetaRes - y)
    J_history = c(J_history, computeCost(X, y, thetaRes))
  }

  return (list(theta=thetaRes, J_history=J_history))
}

library(testthat)

test_that("gradientDescent functions", {
  X = matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow=TRUE)
  y = matrix(c(5, 6), nrow = 2, ncol = 1, byrow=TRUE)
  theta = matrix(c(7, 8), nrow = 2, ncol = 1, byrow=TRUE)
  alpha = .1
  num_iters = 10
  result = gradientDescent(X, y, theta, alpha, num_iters)
  expect_that(result$theta, equals(matrix(c(1.33580, 0.74936), nrow=2, ncol=1, byrow=TRUE), tolerance=1e-4))
  expect_that(result$J_history, equals(c(155.3113, 38.9895, 10.6669, 3.7589, 2.0623, 1.6341, 1.5148, 1.4709, 1.4455, 1.4248), tolerance=1e-4))
});
