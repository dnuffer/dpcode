sigmoid = function(z)
{
  1 / (1 + exp(-z));
}

predict = function(theta, X)
{
  res = sigmoid(X %*% theta) >= 0.5
  res[res == TRUE] = 1.0
  res[res == FALSE] = 0.0
  return(res)
}


library(testthat)

test_that("predict works", {
  t = matrix(c(-25.16154, 0.20623, 0.20147), nrow=3, ncol=1, byrow=TRUE)
  expect_that(predict(t, matrix(c(1.0, 45, 85), nrow=1, ncol=3, byrow=TRUE)), equals(matrix(c(1.0))))
  expect_that(predict(t, matrix(c(1.0, 45, 85, 1.0, 30, 30), nrow=2, ncol=3, byrow=TRUE)), 
              equals(matrix(c(1.0, 0.0), nrow=2, ncol=1, byrow=TRUE)))
});
