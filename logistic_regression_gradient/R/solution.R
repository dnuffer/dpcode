sigmoid = function(z) {
  return(1/(1+exp(-z)))
}

cost.function = function(theta, X, y) {
  m = nrow(y)
  J = (-1 / m) * (t(log(sigmoid(X %*% theta))) %*% y +
                  t(log(1 - sigmoid(X %*% theta))) %*% (1 - y))

  grad = (1 / m) * t(X) %*% (sigmoid(X %*% theta) - y)

  return(list(J=J[1,1], grad=grad))
}

library(testthat)

test_that("logistic regression cost.function works", {
          theta = matrix(c(0,0,0), nrow=3, ncol=1)
          X = matrix(c(1.0000,34.6237,78.0247,1.0000,30.2867,43.8950,1.0000,35.8474,72.9022,1.0000,60.1826,86.3086), nrow=4, ncol=3, byrow=TRUE)
          y = matrix(c(0, 0, 0, 1), nrow=4, ncol=1)
          res = cost.function(theta, X, y)
          expect_that(res$J, equals(0.69315, tol=1e-4))
          expect_that(res$grad, equals(matrix(c(0.25000,5.07190,13.56416), nrow=3, ncol=1), tol=1e-4))
})
