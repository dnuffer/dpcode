sigmoid = function(z)
{
  1 / (1 + exp(-z));
}

# TODO: implement predict for logistic regression

library(testthat)

test_that("predict works", {
  t = matrix(c(-25.16154, 0.20623, 0.20147), nrow=3, ncol=1, byrow=TRUE)
  expect_that(predict(t, matrix(c(1.0, 45, 85), nrow=1, ncol=3, byrow=TRUE)), equals(matrix(c(1.0))))
  expect_that(predict(t, matrix(c(1.0, 45, 85, 1.0, 30, 30), nrow=2, ncol=3, byrow=TRUE)), 
              equals(matrix(c(1.0, 0.0), nrow=2, ncol=1, byrow=TRUE)))
});
